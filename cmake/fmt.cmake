find_package(fmt QUIET)

if(NOT fmt_FOUND)
  include(FetchContent)

  FetchContent_Declare(
    fmt
    GIT_REPOSITORY https://github.com/fmtlib/fmt.git
    GIT_TAG        11.2.0
  )

  FetchContent_MakeAvailable(fmt)
endif()