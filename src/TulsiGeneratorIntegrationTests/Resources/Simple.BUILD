# Copyright 2016 The Tulsi Authors. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Simple mock BUILD file for aspect testing.

load(
    "@build_bazel_rules_apple//apple:ios.bzl",
    "ios_application",
    "ios_unit_test",
)

ios_application(
    name = "Application",
    bundle_id = "application.bundle-id",
    entitlements = "Application/entitlements.entitlements",
    families = [
        "iphone",
        "ipad",
    ],
    infoplists = ["Application/Info.plist"],
    launch_images = [
        "assets.xcassets/images.launchimage/Contents.json",
        "assets.xcassets/images.launchimage/image.png",
    ],
    launch_storyboard = "Application/Launch.storyboard",
    minimum_os_version = "8.0",
    deps = [":ApplicationLibrary"],
)

ios_application(
    name = "TargetApplication",
    bundle_id = "application.bundle-id",
    entitlements = "Application/entitlements.entitlements",
    families = [
        "iphone",
        "ipad",
    ],
    infoplists = ["Application/Info.plist"],
    launch_images = [
        "assets.xcassets/images.launchimage/Contents.json",
        "assets.xcassets/images.launchimage/image.png",
    ],
    launch_storyboard = "Application/Launch.storyboard",
    minimum_os_version = "8.0",
    deps = [":ApplicationLibrary"],
)

objc_library(
    name = "ApplicationLibrary",
    srcs = [
        "ApplicationLibrary/srcs/main.m",
    ],
    asset_catalogs = ["ApplicationLibrary/Assets.xcassets/asset.png"],
    datamodels = glob(["SimpleTest.xcdatamodeld/**"]),
    defines = [
        "APPLIB_ADDITIONAL_DEFINE",
        "APPLIB_ANOTHER_DEFINE=2",
    ],
    includes = ["ApplicationLibrary/includes"],
    storyboards = ["ApplicationLibrary/Base.lproj/One.storyboard"],
    deps = [
        ":Library",
    ],
)

cc_binary(
    name = "ccBinary",
    srcs = [
        "Binary/srcs/main.cc",
    ],
    deps = [
        ":ccLibrary",
    ],
)

objc_library(
    name = "Library",
    srcs = [
        "Library/srcs/SrcsHeader.h",
        "Library/srcs/src1.m",
        "Library/srcs/src2.m",
        "Library/srcs/src3.m",
        "Library/srcs/src4.m",
    ],
    hdrs = [
        "Library/hdrs/HdrsHeader.h",
    ],
    copts = [
        "-DLIBRARY_COPT_DEFINE",
        "-I/Library/absolute/include/path",
        "-Irelative/Library/include/path",
    ],
    defines = ["LIBRARY_DEFINES_DEFINE=1"],
    pch = "Library/pch/PCHFile.pch",
    textual_hdrs = [
        "Library/textual_hdrs/TextualHdrsHeader.h",
    ],
    xibs = ["Library/xibs/xib.xib"],
)

cc_library(
    name = "ccLibrary",
    srcs = [
        "Library/srcs/SrcsHeader.h",
        "Library/srcs/src1.c",
        "Library/srcs/src2.c",
    ],
    hdrs = [
        "Library/hdrs/HdrsHeader.h",
    ],
    defines = ["LIBRARY_DEFINES_DEFINE=1"],
)

objc_library(
    name = "TestLibrary",
    srcs = [
        "XCTest/srcs/src1.mm",
    ],
    deps = [
        ":Library",
    ],
)

ios_unit_test(
    name = "XCTest",
    minimum_os_version = "8.0",
    test_host = ":Application",
    deps = [
        ":TestLibrary",
    ],
)
