#ifndef OPENAI_CPP_LIBRARY_H
#define OPENAI_CPP_LIBRARY_H

#include <string>
#include <curl/curl.h>
#include "nlohmann/json.hpp"

using json = nlohmann::json;

class OpenAIClient {
public:
    OpenAIClient(const std::string& apiKey) : apiKey(apiKey) {}

    std::string ask(const std::string& prompt, const std::string& model_version) {
        json data = {
            {"model", model_version},
            {"prompt", prompt},
            {"max_tokens", 100}
        };
        return makeRequest(data.dump());
    }

private:
    std::string apiKey;
    static size_t WriteCallback(void *contents, size_t size, size_t nmemb, std::string *userp) {
        userp->append((char*)contents, size * nmemb);
        return size * nmemb;
    }
    
    std::string makeRequest(const std::string& data) 
    {
        CURL *curl;
        CURLcode res;
        std::string readBuffer;

        curl_global_init(CURL_GLOBAL_ALL);
        curl = curl_easy_init();
        if(curl) 
        {
            struct curl_slist *headers = NULL;
            headers = curl_slist_append(headers, "Content-Type: application/json");
            std::string authHeader = "Authorization: Bearer " + apiKey;
            headers = curl_slist_append(headers, authHeader.c_str());

            curl_easy_setopt(curl, CURLOPT_URL, "https://api.openai.com/v1/completions");
            curl_easy_setopt(curl, CURLOPT_HTTPHEADER, headers);
            curl_easy_setopt(curl, CURLOPT_POSTFIELDS, data.c_str());
            curl_easy_setopt(curl, CURLOPT_POSTFIELDSIZE, (long)data.length());
            curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, WriteCallback);
            curl_easy_setopt(curl, CURLOPT_WRITEDATA, &readBuffer);

            res = curl_easy_perform(curl);
            if(res != CURLE_OK) {
            fprintf(stderr, "curl_easy_perform() failed: %s\n", curl_easy_strerror(res));
            }

            curl_easy_cleanup(curl);
            curl_slist_free_all(headers);
        }
        curl_global_cleanup();
        return readBuffer;
    }
};

#endif // OPENAI_CPP_LIBRARY_H


