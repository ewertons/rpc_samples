# Copyright (c) Microsoft Corporation. All rights reserved.
# SPDX-License-Identifier: MIT

if (TRANSPORT_MOSQUITTO)

cmake_minimum_required (VERSION 3.10)

project (az_mqtt5_samples LANGUAGES C)

set(CMAKE_C_STANDARD 99)
add_compile_definitions(TRANSPORT_MOSQUITTO)

add_subdirectory(azure-sdk-for-c)

# Azure MQTT5 State Machine RPC Server Sample
add_executable (mosquitto_rpc_server_sample
  ${CMAKE_CURRENT_LIST_DIR}/mosquitto_rpc_server_sample.c
  ${CMAKE_CURRENT_LIST_DIR}/mosquitto_rpc_server_sample_json_parser.c
)

target_include_directories(mosquitto_rpc_server_sample
  PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}
#    ${CMAKE_SOURCE_DIR}/sdk/src/azure/core/
    az_core
)

target_link_libraries(mosquitto_rpc_server_sample
  PRIVATE
  az_core
)

create_map_file(mosquitto_rpc_server_sample mosquitto_rpc_server_sample.map)

# Azure MQTT5 State Machine RPC Client Sample
add_executable (mosquitto_rpc_client_sample
  ${CMAKE_CURRENT_LIST_DIR}/mosquitto_rpc_client_sample.c
)

target_include_directories(mosquitto_rpc_client_sample
  PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}
    ${CMAKE_SOURCE_DIR}/sdk/src/azure/core/
)

target_link_libraries(mosquitto_rpc_client_sample
  PRIVATE
  uuid
  az_core
)

create_map_file(mosquitto_rpc_client_sample mosquitto_rpc_client_sample.map)

endif() # TRANSPORT_MOSQUITTO
