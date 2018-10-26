# By Ryan Cheung
# Copyright (c) 2008 ryancheung <ryancheung.go@gmail.com>
#
#  Redistribution and use is allowed according to the terms of the New
#  BSD license.
#
# Defines:
# SDL_GPU_FOUND
# SDL_GPU_INCLUDE_DIR
# SDL_GPU_LIBRARY
#

if (SDL_GPU_LIBRARY AND SDL_GPU_INCLUDE_DIR)
    set(SDL_GPU_FOUND TRUE)
else (SDL_GPU_LIBRARY AND SDL_GPU_INCLUDE_DIR)
    find_path(SDL_GPU_INCLUDE_DIR
        NAMES SDL_gpu.h
        PATHS ${_SDL_GPU_INCLUDE_DIRS} /usr/include /usr/local/include /opt/local/include /sw/include
        PATH_SUFFIXES SDL2
    )

    find_library(SDL_GPU_LIBRARY
      NAMES SDL2_gpu
      PATHS ${_SDL_GPU_LIBRARY_DIRS} /usr/lib /usr/local/lib /opt/local/lib /sw/lib
    )

    if (SDL_GPU_LIBRARY)
        set(SDL_GPU_FOUND TRUE)
    endif(SDL_GPU_LIBRARY)

    if (SDL_GPU_FOUND)
        if (NOT SDL_GPU_FIND_QUIETLY)
            message(STATUS "Found SDL_gpu: ${SDL_GPU_LIBRARY}, ${SDL_GPU_INCLUDE_DIR}")
        endif (NOT SDL_GPU_FIND_QUIETLY)
    else (SDL_GPU_FOUND)
        if (SDL_GPU_FIND_REQUIRED)
            message(FATAL_ERROR "Could not find SDL_gpu")
        endif (SDL_GPU_FIND_REQUIRED)
    endif (SDL_GPU_FOUND)
endif (SDL_GPU_LIBRARY AND SDL_GPU_INCLUDE_DIR)
