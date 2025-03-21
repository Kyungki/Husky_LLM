#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/kyungki/workspace/husky_ws/src/universal_robot/ur_kinematics"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/kyungki/workspace/husky_ws/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/kyungki/workspace/husky_ws/install/lib/python3/dist-packages:/home/kyungki/workspace/husky_ws/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/kyungki/workspace/husky_ws/build" \
    "/usr/bin/python3" \
    "/home/kyungki/workspace/husky_ws/src/universal_robot/ur_kinematics/setup.py" \
     \
    build --build-base "/home/kyungki/workspace/husky_ws/build/universal_robot/ur_kinematics" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/kyungki/workspace/husky_ws/install" --install-scripts="/home/kyungki/workspace/husky_ws/install/bin"
