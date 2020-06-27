# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Firmware files for the Pinebook Pro that are not included in linux-firmware"
HOMEPAGE="https://gitlab.manjaro.org/manjaro-arm/packages/community/ap6256-firmware"
EGIT_REPO_URI="https://gitlab.manjaro.org/manjaro-arm/packages/community/ap6256-firmware.git"
EGIT_COMMIT="761ff450905c4f685481414341f9f4c321ed016b"

LICENSE="Broadcom"
SLOT="0"
KEYWORDS="~arm64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	rm PKGBUILD
	mkdir brcm

	cp BCM4345C5.hcd brcm/BCM.hcd
	cp BCM4345C5.hcd brcm/BCM4345C5.hcd

	cp nvram_ap6256.txt brcm/brcmfmac43456-sdio.pine64,pinebook-pro.txt

	mv fw_bcm43456c5_ag.bin brcm/brcmfmac43456-sdio.bin

	mv brcmfmac43456-sdio.clm_blob brcm/brcmfmac43456-sdio.clm_blob

	eapply_user
}

src_install() {
	insinto /lib/firmware
	doins -r *
}
