FILESEXTRAPATHS := "${THISDIR}/${PN}"

COMPATIBLE_MACHINE_crownbay = "crownbay"
KMACHINE_crownbay  = "crownbay"

COMPATIBLE_MACHINE_crownbay-noemgd = "crownbay-noemgd"
KMACHINE_crownbay-noemgd  = "crownbay"

SRC_URI += "file://0001-crownbay-update-a-handful-of-EMGD-licenses.patch"
