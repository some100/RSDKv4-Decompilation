add_executable(RetroEngine ${RETRO_FILES})
target_link_options(RetroEngine PRIVATE 
                    -sINITIAL_MEMORY=128mb 
                    -O2 
                    --preload-file ../Data.rsdk@/ 
                    -sLEGACY_GL_EMULATION 
                    --use-port=ogg 
                    --use-port=vorbis
)

set(RETRO_NETWORKING off)

if(RETRO_SDL_VERSION STREQUAL "2")
    target_compile_options(RetroEngine PRIVATE --use-port=sdl2)
    target_link_options(RetroEngine PRIVATE --use-port=sdl2)
elseif(RETRO_SDL_VERSION STREQUAL "1")
    target_link_options(RetroEngine PRIVATE -lSDL)
endif()

if(RETRO_WEB_SAVES)
    target_link_options(RetroEngine PRIVATE -lidbfs.js -sASYNCIFY)
    target_compile_definitions(RetroEngine PRIVATE RETRO_WEB_SAVES=1)
endif()

if(RETRO_MOD_LOADER)
    set_target_properties(RetroEngine PROPERTIES
        CXX_STANDARD 17
        CXX_STANDARD_REQUIRED ON
    )
endif()

set(CMAKE_EXECUTABLE_SUFFIX ".html")