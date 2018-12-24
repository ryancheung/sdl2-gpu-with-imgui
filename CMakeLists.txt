project(sdl_gpu-with-imgui)

cmake_minimum_required(VERSION 2.8.12)

set(CMAKE_CXX_STANDARD 14)

set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

# Override configuration-types - we don't use anything else than debug and release
if(CMAKE_CONFIGURATION_TYPES)
  set(CMAKE_CONFIGURATION_TYPES "Release;Debug" CACHE STRING "Reset the configurations to what we need" FORCE)
else()
  if(NOT CMAKE_BUILD_TYPE)
  if (NOT RELEASE)
      message("Defaulting to debug build.")
      set(CMAKE_BUILD_TYPE Debug CACHE STRING "" FORCE)
    else()
      set(CMAKE_BUILD_TYPE Release CACHE STRING "" FORCE)
    endif()
  endif()
  set_property(CACHE CMAKE_BUILD_TYPE PROPERTY HELPSTRING "Choose the type of build")
  # set the valid options for cmake-gui drop-down list
  set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug;Release")
endif()

find_package(SDL2 REQUIRED)
find_package(SDL_gpu REQUIRED)

set(OpenGL_GL_PREFERENCE "GLVND")
find_package(OpenGL REQUIRED)

include_directories(SYSTEM
  ${CMAKE_SOURCE_DIR}/imgui/examples/libs/gl3w
)

include_directories(
  ${SDL2_INCLUDE_DIR}
  ${SDL_GPU_INCLUDE_DIR}
  ${CMAKE_SOURCE_DIR}/imgui
  ${CMAKE_SOURCE_DIR}/imgui/examples
)

add_subdirectory(imgui)

set(EXECUTABLE_NAME sdl2_gpu_with_imgui)

add_executable(
    ${EXECUTABLE_NAME}
    Main.cpp
)

target_link_libraries(
    ${EXECUTABLE_NAME}
    ${SDL2_LIBRARY}
    ${SDL_GPU_LIBRARY}
    imgui_sdl2
    ${OPENGL_LIBRARIES}
)

install(DIRECTORY ${CMAKE_SOURCE_DIR}/data DESTINATION ${CMAKE_BINARY_DIR})
