# 引用c++ pyd模块会造成报错，在这里禁用类型检查
from cpp_tools import add, hello  # type: ignore

result = add(2, 3)
print(f"The result of adding 2 and 3 is: {result}")

print(f"测试cpp_tools模块是否正常工作: {hello('miao~miao')}")
