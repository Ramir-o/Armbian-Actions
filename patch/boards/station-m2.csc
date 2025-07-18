# Rockchip RK3566 quad core 2GB-8GB GBE eMMC NVMe USB3 WiFi
BOARD_NAME="Station M2"
BOARDFAMILY="rk35xx"
BOARD_MAINTAINER=""
BOOTCONFIG="station-m2-rk3566_defconfig"
KERNEL_TARGET="current,edge,vendor"
KERNEL_TEST_TARGET="current"
FULL_DESKTOP="yes"
BOOT_LOGO="desktop"
BOOT_FDT_FILE="rockchip/rk3566-roc-pc.dtb"
BOOT_SCENARIO="spl-blobs"
ASOUND_STATE="asound.state.station-m2"
IMAGE_PARTITION_TABLE="gpt"

# Override family config for this board; let's avoid conditionals in family config.
function post_family_config__stationm2_use_radxa_vendor_uboot() {
	BOOTSOURCE='https://github.com/radxa/u-boot.git'
	BOOTBRANCH='branch:rk35xx-2024.01'
	BOOTPATCHDIR="u-boot-radxa-latest"

	UBOOT_TARGET_MAP="BL31=$RKBIN_DIR/$BL31_BLOB ROCKCHIP_TPL=$RKBIN_DIR/$DDR_BLOB;;u-boot-rockchip.bin"

	unset uboot_custom_postprocess write_uboot_platform write_uboot_platform_mtd

	function write_uboot_platform() {
		dd if=$1/u-boot-rockchip.bin of=$2 seek=64 conv=notrunc status=none
	}
}

function post_family_tweaks__station-m2_naming_lan() {
	display_alert "$BOARD" "Renaming station-m2 lan" "info"

	mkdir -p "${SDCARD}"/etc/udev/rules.d/
	echo 'SUBSYSTEM=="net", ACTION=="add", DRIVERS=="?*", KERNEL=="end*", NAME="eth0"' > $SDCARD/etc/udev/rules.d/97-rename-lan.rules

	return 0
}
