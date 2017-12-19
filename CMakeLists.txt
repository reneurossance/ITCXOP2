

# The minimum version of CMake required
cmake_minimum_required(VERSION 2.8)

# The project name
project(itcXOP2)

if(CMAKE_SIZEOF_VOID_P EQUAL 4)
  set(bitness "")
  set(bitness_dash "")
  set(bitness_dash_text “-32bit”)
  set(bitness_dir "x86")
elseif(CMAKE_SIZEOF_VOID_P EQUAL 8)
  set(bitness "64")
  set(bitness_dash "-64")
  set(bitness_dash_text "-64bit")
  set(bitness_dir "x64")
endif()

set (target “${PROJECT_NAME}${bitness_dash}”)

if(APPLE)
  # Use RPATH
  cmake_policy(set CMP0042 NEW)
  set(resources “${CMAKE_SOURCE_DIR}/src/mac${PROJECT_NAME}.r")
  set(install_dir "${CMAKE_SOURCE_DIR}/build/mac/${bitness_dir}”)
elseif(WIN32)
  set(resources "${CMAKE_SOURCE_DIR}/src/win/{PROJECT_NAME}.rc")
  set(install_dir "${CMAKE_SOURCE_DIR}/build/win/${bitness_dir}”)
endif()

# Add the files in the include directory
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/${PROJECT_NAME}/include)

# Add sub-directories
add_subdirectory(include)
add_subdirectory(libs)
add_subdirectory(src)

if(APPLE)
  set(misc
    InfoPlist.strings
    ${CMAKE_BINARY_DIR}/${target}.rsrc)

  add_executable(${target} 
   MACOSX_BUNDLE 
   ${source} 
   ${source_ext} 
   ${includes} 
   ${resources}
   ${misc}) 

   set_target_properties(${target} PROPERTIES PREFIX “”)

   set_target_properties(${target} PROPERTIES BUNDLE_EXTENSION "xop")
   set_target_properties(${target} PROPERTIES ENABLE_EXPORTS true)
   set_target_properties(${target} PROPERTIES XCODE_ATTRIBUTE_EXPORTED_SYMBOLS_FILE "$  {CMAKE_SOURCE_DIR}/Exports.exp")
   set_target_properties(${target} PROPERTIES XCODE_ATTRIBUTE_MACH_O_TYPE mh_bundle)

  set(sysroot)
  if(CMAKE_OSX_SYSROOT)
    set(sysroot -isysroot ${CMAKE_OSX_SYSROOT})
  endif()
  
  set_target_properties(${target} PROPERTIES CXX_STANDARD 14)

  find_library(carbon Carbon)
  find_library(cocoa Cocoa)
  find_library(audio_unit AudioUnit)
  find_library(audio_toolbox AudioToolbox)
  find_library(itc ITC)
  if(not itc)
    message(FATAL_error “Could not find ITC framework.”)
  endif()

  mark_as_advanced(carbon cocoa audio_unit audio_toolbox)
  set(extra_libs ${carbon} ${cocoa} ${audio_unit} ${audio_toolbox} ${its})
  
  find_program(apple_resource Rez /Developer/Tools)
  if(not apple_resource)
    message(FATAL_error “Could not find Rez to build resource from .r file.”)
  endif()

  add_custom_command(TARGET ${target}
    PRE_BUILD
    COMMAND ${apple_resource}
    ${sysroot}
    -i XOPSupport
    -F ${carbon}
    -useDF
    ${resources}
    -o ${CMAKE_BINARY_DIR}/${target}.rsrc
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR})

  add_custom_command(TARGET ${target}
    POST_BUILD
    COMMAND zip
    -r ${target}.zip
    ${CMAKE_CFG_INTDIR}/${target}.xop
    WORKING_DIRECTORY ${CMAKE_BINARY_DIR})

  set_source_file_properties(
      ${CMAKE_BINARY_DIR}/${target}.rsrc
      PROPERTIES GENERATED 1)

  set_source_file_properties(
    ${CMAKE_BINARY_DIR}/${target}.rsrc
    PROPERTIES MACOSX_PACKAGE_LOCATION "Resources")

  set_source_file_properties(
    ${CMAKE_SOURCE_DIR}/InfoPlist.strings
    PROPERTIES MACOSX_PACKAGE_LOCATION "Resources/English.lproj")













#Add files to 
add_executable(itcXOP2 main.c)



#instal for win and mac
#win: /bin/win
#mac: /bin/mac

install(TARGETS itcXOP2 DESTINATION bin)


