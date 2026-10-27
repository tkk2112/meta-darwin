FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append:class-nativesdk:darwin21 = "\
    file://0001-pylifecycle-disable-apple-system-log-with-gcc.patch \
    file://0002-remote-debug-use-sysconf-for-page-size.patch \
    file://0003-configure-disable-posix-macros-for-cross-darwin.patch \
"

# CPython probes sw_vers on the Linux build host.
# Match the deployment target used by meta-darwin.
MACOSX_DEPLOYMENT_TARGET:class-nativesdk:darwin21 = "12.3"

export MACOSX_DEPLOYMENT_TARGET

# OE-Core packages Linux libpython*.so.* files, but Darwin builds
# install the runtime library as libpython3.14.dylib.
FILES:libpython3:append:class-nativesdk:darwin21 = " ${libdir}/libpython${PYTHON_MAJMIN}.dylib"
