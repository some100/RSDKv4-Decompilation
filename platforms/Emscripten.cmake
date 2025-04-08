add_executable(RetroEngine ${RETRO_FILES})
target_link_options(RetroEngine PRIVATE 
                    -sINITIAL_MEMORY=128mb 
                    -Oz
                    -sLEGACY_GL_EMULATION
                    --use-port=ogg
                    --use-port=vorbis
                    --use-preload-cache
                    --preload-file ../files@/
                    -lidbfs.js
)
target_compile_options(RetroEngine PRIVATE 
                    --use-port=ogg
                    --use-port=vorbis
                    -Oz
)

set(RETRO_NETWORKING off)

if(RETRO_SDL_VERSION STREQUAL "2")
    target_compile_options(RetroEngine PRIVATE --use-port=sdl2)
    target_link_options(RetroEngine PRIVATE --use-port=sdl2)
elseif(RETRO_SDL_VERSION STREQUAL "1")
    target_link_options(RetroEngine PRIVATE -lSDL)
endif()

if(RETRO_MOD_LOADER)
    set_target_properties(RetroEngine PROPERTIES
        CXX_STANDARD 17
        CXX_STANDARD_REQUIRED ON
    )
endif()

set(CMAKE_EXECUTABLE_SUFFIX ".html")