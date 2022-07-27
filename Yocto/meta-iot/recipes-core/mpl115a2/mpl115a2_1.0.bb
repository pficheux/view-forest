DESCRIPTION = "MPL115A2 I2C driver"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
PR = "r0"

SRC_URI = "http://pficheux.free.fr/pub/tmp/mpl115a2-1.0.tar.gz file://init file://get_value.sh"

inherit update-rc.d

INITSCRIPT_NAME = "mpl115a2"
INITSCRIPT_PARAMS = "defaults 99"

do_install() {
        oe_runmake install DESTDIR=${D}
        install -m 0755 ${WORKDIR}/get_value.sh ${D}${bindir}
        install -d ${D}${sysconfdir}/init.d
        install -m 0755 ${WORKDIR}/init  ${D}${sysconfdir}/init.d/mpl115a2
}

SRC_URI[md5sum] = "00898e20490dcc5e4502724127a0502c"
