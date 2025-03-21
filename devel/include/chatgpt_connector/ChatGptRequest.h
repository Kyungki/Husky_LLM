// Generated by gencpp from file chatgpt_connector/ChatGptRequest.msg
// DO NOT EDIT!


#ifndef CHATGPT_CONNECTOR_MESSAGE_CHATGPTREQUEST_H
#define CHATGPT_CONNECTOR_MESSAGE_CHATGPTREQUEST_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace chatgpt_connector
{
template <class ContainerAllocator>
struct ChatGptRequest_
{
  typedef ChatGptRequest_<ContainerAllocator> Type;

  ChatGptRequest_()
    : prompt()  {
    }
  ChatGptRequest_(const ContainerAllocator& _alloc)
    : prompt(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _prompt_type;
  _prompt_type prompt;





  typedef boost::shared_ptr< ::chatgpt_connector::ChatGptRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::chatgpt_connector::ChatGptRequest_<ContainerAllocator> const> ConstPtr;

}; // struct ChatGptRequest_

typedef ::chatgpt_connector::ChatGptRequest_<std::allocator<void> > ChatGptRequest;

typedef boost::shared_ptr< ::chatgpt_connector::ChatGptRequest > ChatGptRequestPtr;
typedef boost::shared_ptr< ::chatgpt_connector::ChatGptRequest const> ChatGptRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::chatgpt_connector::ChatGptRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::chatgpt_connector::ChatGptRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::chatgpt_connector::ChatGptRequest_<ContainerAllocator1> & lhs, const ::chatgpt_connector::ChatGptRequest_<ContainerAllocator2> & rhs)
{
  return lhs.prompt == rhs.prompt;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::chatgpt_connector::ChatGptRequest_<ContainerAllocator1> & lhs, const ::chatgpt_connector::ChatGptRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace chatgpt_connector

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::chatgpt_connector::ChatGptRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::chatgpt_connector::ChatGptRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::chatgpt_connector::ChatGptRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::chatgpt_connector::ChatGptRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::chatgpt_connector::ChatGptRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::chatgpt_connector::ChatGptRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::chatgpt_connector::ChatGptRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d0b05839404bd41adf8ff6cbb733e1fe";
  }

  static const char* value(const ::chatgpt_connector::ChatGptRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd0b05839404bd41aULL;
  static const uint64_t static_value2 = 0xdf8ff6cbb733e1feULL;
};

template<class ContainerAllocator>
struct DataType< ::chatgpt_connector::ChatGptRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "chatgpt_connector/ChatGptRequest";
  }

  static const char* value(const ::chatgpt_connector::ChatGptRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::chatgpt_connector::ChatGptRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string prompt \n"
;
  }

  static const char* value(const ::chatgpt_connector::ChatGptRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::chatgpt_connector::ChatGptRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.prompt);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ChatGptRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::chatgpt_connector::ChatGptRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::chatgpt_connector::ChatGptRequest_<ContainerAllocator>& v)
  {
    s << indent << "prompt: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.prompt);
  }
};

} // namespace message_operations
} // namespace ros

#endif // CHATGPT_CONNECTOR_MESSAGE_CHATGPTREQUEST_H
