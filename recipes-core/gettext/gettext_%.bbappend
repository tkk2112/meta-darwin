FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

PACKAGES += "gettext-alias"
# For some unknown reason this file isn't packaged while building nativesdk-gettext
FILES:gettext-alias = "${datadir}/locale/locale.alias"

do_install:append:class-nativesdk() {
    if [ "${SDK_OS}" = "darwin21" ]; then
        ${TARGET_SYS}-install_name_tool \
            -id @rpath/libintl.8.dylib \
            ${D}${libdir}/libintl.8.dylib
    fi
}
