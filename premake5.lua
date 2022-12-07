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
		"./include/**.hpp",
	}

	filter "action:vs*"
		disablewarnings { "4244" }

 	filter "system:windows"
		defines { "_CRT_SECURE_NO_WARNINGS" }