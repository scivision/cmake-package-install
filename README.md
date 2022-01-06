# CMake package install example

Example of minimal CMake package creation for relocatable install

```sh
cmake -B build --install-prefix $HOME/demo

cmake --build build

cmake --install build
```
