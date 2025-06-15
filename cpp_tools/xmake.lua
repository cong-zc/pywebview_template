add_rules("mode.debug", "mode.release")

-- 获取 Python 安装路径（自动检测）
local python_path = os.getenv("PYTHON_HOME") or "G:\\python\\"  -- 修改为你的路径
local python_ver = "311"  -- 根据你的版本修改（3.9→39, 3.10→310）

-- 添加pybind11库
add_requires("vcpkg::pybind11",{
    configs = {
        python = python_path,  -- 设置Python路径
        version = python_ver,  -- 设置Python版本
    }
})

target("cpp_tools")
    set_kind("shared")
    set_version("1.0.0")
    set_languages("c++17")
    -- add_headerfiles("include/*.h")
    add_files("src/*.cpp")

    -- 添加pybind11依赖
    add_packages("vcpkg::pybind11")

    -- 手动添加 Python 路径
    add_includedirs(python_path .. "/include")
    add_linkdirs(python_path .. "/libs")
    add_links("python" .. python_ver)  -- 如 python39

    -- 设置输出名（避免平台差异）
    if is_plat("windows") then
        set_targetdir("$(buildir)/lib")  -- Windows 输出到 lib 目录
        set_filename("cpp_tools.pyd")       -- Windows 后缀为 .pyd
    else
        set_targetdir("$(buildir)")       -- Linux/macOS 输出到根目录
        set_filename("cpp_tools.so")        -- Linux/macOS 后缀为 .so
    end

--
-- If you want to known more usage about xmake, please see https://xmake.io
--
-- ## FAQ
--
-- You can enter the project directory firstly before building project.
--
--   $ cd projectdir
--
-- 1. How to build project?
--
--   $ xmake
--
-- 2. How to configure project?
--
--   $ xmake f -p [macosx|linux|iphoneos ..] -a [x86_64|i386|arm64 ..] -m [debug|release]
--
-- 3. Where is the build output directory?
--
--   The default output directory is `./build` and you can configure the output directory.
--
--   $ xmake f -o outputdir
--   $ xmake
--
-- 4. How to run and debug target after building project?
--
--   $ xmake run [targetname]
--   $ xmake run -d [targetname]
--
-- 5. How to install target to the system directory or other output directory?
--
--   $ xmake install
--   $ xmake install -o installdir
--
-- 6. Add some frequently-used compilation flags in xmake.lua
--
-- @code
--    -- add debug and release modes
--    add_rules("mode.debug", "mode.release")
--
--    -- add macro definition
--    add_defines("NDEBUG", "_GNU_SOURCE=1")
--
--    -- set warning all as error
--    set_warnings("all", "error")
--
--    -- set language: c99, c++11
--    set_languages("c99", "c++11")
--
--    -- set optimization: none, faster, fastest, smallest
--    set_optimize("fastest")
--
--    -- add include search directories
--    add_includedirs("/usr/include", "/usr/local/include")
--
--    -- add link libraries and search directories
--    add_links("tbox")
--    add_linkdirs("/usr/local/lib", "/usr/lib")
--
--    -- add system link libraries
--    add_syslinks("z", "pthread")
--
--    -- add compilation and link flags
--    add_cxflags("-stdnolib", "-fno-strict-aliasing")
--    add_ldflags("-L/usr/local/lib", "-lpthread", {force = true})
--
-- @endcode
--

