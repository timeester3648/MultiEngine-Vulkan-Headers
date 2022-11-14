include "../../premake/common_premake_defines.lua"

project "Vulkan-Headers"
	kind "StaticLib"
	language "C++"
	cppdialect "C++latest"
	cdialect "C17"
	targetname "%{prj.name}"
	inlining "Auto"

	files {
		"./include/**.h",
	}

 	filter "system:windows"
		disablewarnings { "4244" }
		defines { "_CRT_SECURE_NO_WARNINGS" }

 	filter "configurations:Debug"
		defines { "MLE_DEBUG_BUILD", "DEBUG" }
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines { "MLE_RELEASE_BUILD", "NDEBUG" }
		flags { "LinkTimeOptimization" }
		runtime "Release"
		optimize "speed"
		intrinsics "on"

	filter "configurations:Distribution"
		defines {  "MLE_DISTRIBUTION_BUILD", "NDEBUG" }
		flags { "LinkTimeOptimization" }
		runtime "Release"
		optimize "speed"
		intrinsics "on"