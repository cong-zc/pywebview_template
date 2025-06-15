#include <pybind11/pybind11.h>//即使成功引用了pybind11库，但仍然会出现警告


int add(int a, int b) {
    return a + b;
}

std::string hello(std::string name) {

    return "Hello, " + name + "!";
}

// 使用 pybind11 导出模块
PYBIND11_MODULE(cpp_tools, m) {
    m.doc() = "pybind11 cpp_tools module";
    m.def("add", &add, "Add two numbers");
    m.def("hello", &hello, "Return a hello world string");
}