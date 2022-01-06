# CMake package install example

Example of minimal CMake package creation for relocatable install.

```sh
cmake -B build --install-prefix $HOME/demo

cmake --build build

cmake --install build
```

Inside CMakeLists.txt, the `install(TARGETS ...)` command tells CMake to install the library binary as well as the header files.
For Fortran, the module files are generated at build time, and are installed with the "install(FILES)" command.

The **header files** needed by C, C++ targets are registered in CMake with the `set_target_properties(... PUBLIC_HEADER ...)` command.

The **Fortran module files** needed by Fortran targets are described with two commands: `set_target_properties(... Fortran_MODULE_DIRECTORY ...)`
that tells CMake where to *put* the module files, and
`target_include_directories()` that tells CMake where to *find* the module files.

The command structure `target_include_directories(... PUBLIC $<BUILD_INTERFACE:...> $<INSTALL_INTERFACE:include>)` is used to tell CMake where to find the header/module files at build time *and* install time.
