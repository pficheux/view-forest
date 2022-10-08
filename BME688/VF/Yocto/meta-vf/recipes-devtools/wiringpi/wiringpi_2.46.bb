DESCRIPTION = "A library to control Raspberry Pi GPIO channels"
SECTION = "devel/libs"
LICENSE = "LGPLv3+"
LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02"

DEPENDS += "virtual/crypt"

SRC_URI = "http://pficheux.free.fr/pub/tmp/wiringpi-2.46.tar.gz"

COMPATIBLE_MACHINE = "^rpi$"

CFLAGS_prepend = "-I${S}/wiringPi -I${S}/devLib "

EXTRA_OEMAKE += "'INCLUDE_DIR=${D}${includedir}' 'LIB_DIR=${D}${libdir}'"
EXTRA_OEMAKE += "'DESTDIR=${D}/usr' 'PREFIX=""'"

SRC_URI[md5sum] = "6576638f698e697ca9868f7f13e2ce82"

do_compile() {
    oe_runmake -C devLib
    oe_runmake -C wiringPi
    oe_runmake -C gpio 'LDFLAGS=${LDFLAGS} -L${S}/wiringPi -L${S}/devLib'
}

do_install() {
    oe_runmake -C devLib install
    oe_runmake -C wiringPi install
    oe_runmake -C gpio install
}
