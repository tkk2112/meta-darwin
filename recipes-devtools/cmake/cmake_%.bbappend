FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append:class-nativesdk:darwin21 = "\
    file://0001-xcode-avoid-applicationservices-with-gcc.patch \
"
