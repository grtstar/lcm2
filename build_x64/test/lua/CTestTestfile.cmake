# CMake generated Testfile for 
# Source directory: /home/grt/ls/reality/depends/third_party/lcm2/test/lua
# Build directory: /home/grt/ls/reality/depends/third_party/lcm2/build_x64/test/lua
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(Lua::client_server "/usr/bin/cmake" "-E" "env" "LUA_PATH=/home/grt/ls/reality/depends/third_party/lcm2/build_x64/test/types/?.lua;/home/grt/ls/reality/depends/third_party/lcm2/build_x64/test/types/?/init.lua" "LUA_CPATH=/home/grt/ls/reality/depends/third_party/lcm2/build_x64/lcm-lua/lcm.so" "/usr/bin/python" "/home/grt/ls/reality/depends/third_party/lcm2/test/lua/../run_client_server_test.py" "/home/grt/ls/reality/depends/third_party/lcm2/build_x64/test/c/test-c-server" "/usr/bin/lua" "/home/grt/ls/reality/depends/third_party/lcm2/test/lua/client.lua")
set_tests_properties(Lua::client_server PROPERTIES  _BACKTRACE_TRIPLES "/home/grt/ls/reality/depends/third_party/lcm2/test/lua/CMakeLists.txt;8;add_test;/home/grt/ls/reality/depends/third_party/lcm2/test/lua/CMakeLists.txt;0;")
