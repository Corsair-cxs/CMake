set(whitespaces_ "[\t\n\r ]*")

set(EXPECTED_FILES_COUNT "0")

if(RunCMake_SUBTEST_SUFFIX STREQUAL "valid" OR RunCMake_SUBTEST_SUFFIX STREQUAL "no_debuginfo")
  set(EXPECTED_FILES_COUNT "4")
  set(EXPECTED_FILE_1 "single_debuginfo-0.1.1-1.*.rpm")
  set(EXPECTED_FILE_CONTENT_1 "^/usr/foo${whitespaces_}/usr/foo/test_prog$")
  set(EXPECTED_FILE_2 "single_debuginfo*-headers.rpm")
  set(EXPECTED_FILE_CONTENT_2 "^/usr/bar${whitespaces_}/usr/bar/CMakeLists.txt$")
  set(EXPECTED_FILE_3 "single_debuginfo*-libs.rpm")
  set(EXPECTED_FILE_CONTENT_3 "^/usr/bas${whitespaces_}/usr/bas/libtest_lib.so$")

  set(EXPECTED_FILE_4 "single_debuginfo-debuginfo*.rpm")
  set(EXPECTED_FILE_CONTENT_4 ".*/src${whitespaces_}/src/src_1${whitespaces_}/src/src_1/main.cpp${whitespaces_}/src/src_1/test_lib.cpp.*")
elseif(RunCMake_SUBTEST_SUFFIX STREQUAL "one_component" OR RunCMake_SUBTEST_SUFFIX STREQUAL "one_component_no_debuginfo")
  set(EXPECTED_FILES_COUNT "2")
  set(EXPECTED_FILE_1 "single_debuginfo-0*-applications.rpm")
  set(EXPECTED_FILE_CONTENT_1 "^/usr/foo${whitespaces_}/usr/foo/test_prog$")

  set(EXPECTED_FILE_2 "single_debuginfo-applications-debuginfo*.rpm")
  set(EXPECTED_FILE_CONTENT_2 ".*/src${whitespaces_}/src/src_1${whitespaces_}/src/src_1/main.cpp.*")
elseif(RunCMake_SUBTEST_SUFFIX STREQUAL "one_component_main" OR RunCMake_SUBTEST_SUFFIX STREQUAL "no_components")
  set(EXPECTED_FILES_COUNT "2")
  set(EXPECTED_FILE_1 "single_debuginfo-0*.rpm")
  set(EXPECTED_FILE_CONTENT_1 "^/usr/foo${whitespaces_}/usr/foo/test_prog$")

  set(EXPECTED_FILE_2 "single_debuginfo-debuginfo*.rpm")
  set(EXPECTED_FILE_CONTENT_2 ".*/src${whitespaces_}/src/src_1${whitespaces_}/src/src_1/main.cpp.*")
endif()
