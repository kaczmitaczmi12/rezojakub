# *****************************************************************************
# Project protobuf
# *****************************************************************************
project(canary_protobuf)

find_package(Protobuf CONFIG)
if (NOT Protobuf_FOUND)
  find_package(Protobuf REQUIRED)
endif()

include_directories(${PROTOBUF_INCLUDE_DIRS})

file(GLOB ProtoFiles
    "${CMAKE_CURRENT_SOURCE_DIR}/appearances.proto"
)

if (TARGET protobuf::libprotobuf AND COMMAND protobuf_generate)
  add_library(${PROJECT_NAME} ${ProtoFiles})
  protobuf_generate(
    TARGET ${PROJECT_NAME}
    LANGUAGE cpp
    PROTOS ${ProtoFiles}
  )
  target_link_libraries(${PROJECT_NAME} PRIVATE protobuf::libprotobuf)
else()
  PROTOBUF_GENERATE_CPP(ProtoSources ProtoHeaders ${ProtoFiles})
  add_library(${PROJECT_NAME} ${ProtoSources} ${ProtoHeaders})
  target_link_libraries(${PROJECT_NAME} PRIVATE ${PROTOBUF_LIBRARY})
endif()

add_custom_command(
        TARGET ${PROJECT_NAME} POST_BUILD
        # Copy files "appearances.pb.cc" to the "src/protobuf" folder
        COMMAND ${CMAKE_COMMAND} -E copy
                ${CMAKE_CURRENT_BINARY_DIR}/appearances.pb.cc
                ${CMAKE_CURRENT_SOURCE_DIR}/appearances.pb.cc

        # Copy files "appearances.pb.h" to the "src/protobuf" folder
        COMMAND ${CMAKE_COMMAND} -E copy
                ${CMAKE_CURRENT_BINARY_DIR}/appearances.pb.h
                ${CMAKE_CURRENT_SOURCE_DIR}/appearances.pb.h
 )
