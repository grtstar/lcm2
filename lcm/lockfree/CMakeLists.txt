cmake_minimum_required(VERSION 3.12)
project(lockfree)

set(CMAKE_CXX_STANDARD 11)

# Add your source files here
set(SOURCES
    lf_bcast.c
    lf_pool.c
    lf_queue.c
    lf_shm.c
)

# Add any additional include directories here
include_directories(
    include
)
set(CMAKE_C_STANDARD 11)

# Add any additional libraries here
set(LIBRARIES
    pthread
)

# Create a static library
add_library(lockfree STATIC ${SOURCES})

# Link the libraries
target_link_libraries(lockfree ${LIBRARIES})

# Install the library
install(TARGETS lockfree
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib
    RUNTIME DESTINATION bin
)
# Install the header files
# install(FILES src/lf_bcast.h DESTINATION include/lockfree)
# install(FILES src/lf_pool.h DESTINATION include/lockfree)
# install(FILES src/lf_queue.h DESTINATION include/lockfree)
# install(FILES src/lf_shm.h DESTINATION include/lockfree)
# install(FILES src/lf_util.h DESTINATION include/lockfree)