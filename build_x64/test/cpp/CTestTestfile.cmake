# CMake generated Testfile for 
# Source directory: /home/grt/ls/reality/depends/third_party/lcm2/test/cpp
# Build directory: /home/grt/ls/reality/depends/third_party/lcm2/build_x64/test/cpp
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(CPP::memq_test "/home/grt/ls/reality/depends/third_party/lcm2/build_x64/test/cpp/test-cpp-memq_test")
set_tests_properties(CPP::memq_test PROPERTIES  _BACKTRACE_TRIPLES "/home/grt/ls/reality/depends/third_party/lcm2/test/cpp/CMakeLists.txt;12;add_test;/home/grt/ls/reality/depends/third_party/lcm2/test/cpp/CMakeLists.txt;0;")
add_test(CPP::client_server "/usr/bin/python" "/home/grt/ls/reality/depends/third_party/lcm2/test/cpp/../run_client_server_test.py" "/home/grt/ls/reality/depends/third_party/lcm2/build_x64/test/c/test-c-server" "/home/grt/ls/reality/depends/third_party/lcm2/build_x64/test/cpp/test-cpp-client")
set_tests_properties(CPP::client_server PROPERTIES  _BACKTRACE_TRIPLES "/home/grt/ls/reality/depends/third_party/lcm2/test/cpp/CMakeLists.txt;15;add_test;/home/grt/ls/reality/depends/third_party/lcm2/test/cpp/CMakeLists.txt;0;")
