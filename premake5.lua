project "speexdsp"
    kind "StaticLib"
    language "C"
    staticruntime "off"
    warnings "off"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir    ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "include/speex/*.h",
        "libspeexdsp/preprocess.c",
        "libspeexdsp/fftwrap.c",
        "libspeexdsp/smallft.c",
        "libspeexdsp/filterbank.c",
        "libspeexdsp/arch.h",
        "libspeexdsp/_kiss_fft_guts.h",
        "libspeexdsp/fftwrap.h",
        "libspeexdsp/filterbank.h",
        "libspeexdsp/math_approx.h",
        "libspeexdsp/os_support.h",
        "libspeexdsp/pseudofloat.h",
        "libspeexdsp/smallft.h",
        "libspeexdsp/stack_alloc.h",
        "libspeexdsp/vorbis_psy.h",
        "win32/config.h",
    }

    includedirs
    {
        "%{prj.location}/include",
        "%{prj.location}/libspeexdsp",
        "%{prj.location}/win32",
    }

    defines
    {
        "HAVE_CONFIG_H",
        "_CRT_SECURE_NO_WARNINGS",
    }

    filter { "configurations:Debug" }
        runtime "Debug"
        symbols "On"

    filter { "configurations:Release" }
        runtime "Release"
        optimize "On"
        defines { "NDEBUG" }
    filter {}
