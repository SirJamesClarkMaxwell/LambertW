project "LambertW"
    kind "StaticLib"
    language "C++"
    cppdialect "C++latest"
    staticruntime(srunt)

    location ( "%{wks.location}/Vendor/LambertW/" )

    files {
        "%{prj.location}/*.h",
        "%{prj.location}/*.cc",
    }

    includedirs {
        "%{prj.location}",
        "%{prj.location}/**",
    }
    removefiles{
        "%{prj.location}/test_accuracy.cxx",
        "%{prj.location}/lambertw.cxx",
    }
    defines{
        "M_E=2.7182818284590452354"
    }
    targetdir ( "%{wks.location}/lib/" )
    objdir ( "%{wks.location}/obj/%{cfg.buildcfg}" )

    libdirs ( "%{wks.location}/lib" )

    filter { "configurations:Debug" }
        defines { "DEBUG" }
        runtime "Debug"

    filter { "configurations:Release" }
        runtime "Release"

    filter { "system:windows" }
        ignoredefaultlibraries { "msvcrt" }
