# C++ CMake Starter Template

This repository provides a clean and cross-platform C++ project template using **CMake** and **Makefile**. It is designed for modern C++ development with easy compilation on **Linux**, **Windows**, and **macOS**, and supports both **static** and **dynamic linking**.

## ✅ Features

- 🧱 Minimal and modular `CMakeLists.txt`
- 🔧 Customizable `Makefile` (Release / Debug / Clean)
- 📦 Static linking support via `BUILD_STATIC` option
- 🛠️ Support for `Debug` and `Release` builds
- 💡 Automatically generates `compile_commands.json` for LSPs
- 🪟🖥️ Compatible with Windows, macOS, and Linux
- 🧪 Ready for unit testing integration

---

## 📁 Project Structure

```sh
project-root/
├── CMakeLists.txt
├── Makefile
├── src/
│   └── main.cpp
```

---

## 🚀 Quick Start

### 🖥️ Linux / macOS

#### Release build

```sh
make
```

#### Debug build

```sh
make debug
```

#### Clean builds

```sh
make clean
```

#### Run the program

```sh
./MyProject
```

### 🪟 Windows (MinGW or WSL)

```sh
make
# or use CMake directly
cmake -B build -DCMAKE_BUILD_TYPE=Release -DBUILD_STATIC=ON
cmake --build build
```

---

## ⚙️ CMake Options

| Option              | Default | Description                             |
|---------------------|---------|-----------------------------------------|
| `BUILD_STATIC`      | OFF     | Enables static linking of stdlib/gcc    |
| `CMAKE_BUILD_TYPE`  | Release | Enables optimization or debug symbols   |

---

## 🛠️ Output Directory

You can change the output directory of the final binary by modifying the following line in the `Makefile`:

```make
OUTPUT_DIR := .  # Output directory for binaries (can be changed as needed)
```

This lets you control whether the binary appears in the project root, a `bin/` folder, or elsewhere.

---

## 🧪 Testing (Optional)

The CMake config includes a placeholder for adding tests:

```cmake
enable_testing()
# add_subdirectory(test)
```

---

## 📄 License

This project is licensed under the [MIT License](./LICENSE) — feel free to use it as a boilerplate for your own C++ projects.

---

## ✨ Author

Made with ❤️ by [Evr5](https://github.com/Evr5)
Feel free to contribute, fork, or suggest improvements!
