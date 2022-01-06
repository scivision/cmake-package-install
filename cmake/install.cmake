# https://cmake.org/cmake/help/latest/command/find_package.html#config-mode-search-procedure

include(CMakePackageConfigHelpers)

configure_package_config_file(${CMAKE_CURRENT_LIST_DIR}/config.cmake.in
${CMAKE_CURRENT_BINARY_DIR}/CMakeFiles/${PROJECT_NAME}-config.cmake
INSTALL_DESTINATION cmake
)

write_basic_package_version_file(
${CMAKE_CURRENT_BINARY_DIR}/CMakeFiles/${PROJECT_NAME}-config-version.cmake
COMPATIBILITY SameMinorVersion
)

install(EXPORT ${PROJECT_NAME}-targets
NAMESPACE ${PROJECT_NAME}::
DESTINATION cmake
)

install(FILES
${CMAKE_CURRENT_BINARY_DIR}/CMakeFiles/${PROJECT_NAME}-config.cmake
${CMAKE_CURRENT_BINARY_DIR}/CMakeFiles/${PROJECT_NAME}-config-version.cmake
DESTINATION cmake
)
