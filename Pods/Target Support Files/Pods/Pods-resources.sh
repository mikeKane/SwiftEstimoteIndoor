#!/bin/sh
set -e

mkdir -p "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"

RESOURCES_TO_COPY=${PODS_ROOT}/resources-to-copy-${TARGETNAME}.txt
> "$RESOURCES_TO_COPY"

XCASSET_FILES=""

install_resource()
{
  case $1 in
    *.storyboard)
      echo "ibtool --reference-external-strings-file --errors --warnings --notices --output-format human-readable-text --compile ${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$1\" .storyboard`.storyboardc ${PODS_ROOT}/$1 --sdk ${SDKROOT}"
      ibtool --reference-external-strings-file --errors --warnings --notices --output-format human-readable-text --compile "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$1\" .storyboard`.storyboardc" "${PODS_ROOT}/$1" --sdk "${SDKROOT}"
      ;;
    *.xib)
        echo "ibtool --reference-external-strings-file --errors --warnings --notices --output-format human-readable-text --compile ${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$1\" .xib`.nib ${PODS_ROOT}/$1 --sdk ${SDKROOT}"
      ibtool --reference-external-strings-file --errors --warnings --notices --output-format human-readable-text --compile "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$1\" .xib`.nib" "${PODS_ROOT}/$1" --sdk "${SDKROOT}"
      ;;
    *.framework)
      echo "mkdir -p ${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      mkdir -p "${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      echo "rsync -av ${PODS_ROOT}/$1 ${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      rsync -av "${PODS_ROOT}/$1" "${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      ;;
    *.xcdatamodel)
      echo "xcrun momc \"${PODS_ROOT}/$1\" \"${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1"`.mom\""
      xcrun momc "${PODS_ROOT}/$1" "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1" .xcdatamodel`.mom"
      ;;
    *.xcdatamodeld)
      echo "xcrun momc \"${PODS_ROOT}/$1\" \"${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1" .xcdatamodeld`.momd\""
      xcrun momc "${PODS_ROOT}/$1" "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1" .xcdatamodeld`.momd"
      ;;
    *.xcmappingmodel)
      echo "xcrun mapc \"${PODS_ROOT}/$1\" \"${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1" .xcmappingmodel`.cdm\""
      xcrun mapc "${PODS_ROOT}/$1" "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1" .xcmappingmodel`.cdm"
      ;;
    *.xcassets)
      XCASSET_FILES="$XCASSET_FILES '$1'"
      ;;
    /*)
      echo "$1"
      echo "$1" >> "$RESOURCES_TO_COPY"
      ;;
    *)
      echo "${PODS_ROOT}/$1"
      echo "${PODS_ROOT}/$1" >> "$RESOURCES_TO_COPY"
      ;;
  esac
}
if [[ "$CONFIGURATION" == "Debug" ]]; then
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/5a.mov"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/5b.mov"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/8a.mov"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/8b.mov"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/8c.mov"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/5a_first_frame@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/5b_first_frame@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/8a_first_frame@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/8b_first_frame@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/8c_first_frame@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/beacon_grey@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/beaconblueberry@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/beaconBlueberrySmall.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/beaconBlueberrySmall@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/beacongrey@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/beaconGreySmall@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/beaconicy@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/beaconIcySmall.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/beaconIcySmall@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/beaconmint@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/beaconMintSmall.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/beaconMintSmall@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/indoor_error@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/instructions@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/navigation_guy@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/screen8_beacon_blue@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/screen8_beacon_gray@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/screen8_beacon_gray_trans@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/screen8_beacon_green@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/screen8_beacon_purple@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/tick@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/welcome@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/SixBeaconsView.xib"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/wall_bump.wav"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images"
fi
if [[ "$CONFIGURATION" == "Release" ]]; then
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/5a.mov"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/5b.mov"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/8a.mov"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/8b.mov"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/8c.mov"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/5a_first_frame@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/5b_first_frame@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/8a_first_frame@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/8b_first_frame@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/8c_first_frame@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/beacon_grey@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/beaconblueberry@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/beaconBlueberrySmall.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/beaconBlueberrySmall@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/beacongrey@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/beaconGreySmall@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/beaconicy@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/beaconIcySmall.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/beaconIcySmall@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/beaconmint@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/beaconMintSmall.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/beaconMintSmall@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/indoor_error@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/instructions@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/navigation_guy@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/screen8_beacon_blue@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/screen8_beacon_gray@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/screen8_beacon_gray_trans@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/screen8_beacon_green@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/screen8_beacon_purple@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/tick@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images/welcome@2x.png"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/SixBeaconsView.xib"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/wall_bump.wav"
  install_resource "EstimoteIndoorSDK/EstimoteIndoorLocationSDK/Resources/Images"
fi

rsync -avr --copy-links --no-relative --exclude '*/.svn/*' --files-from="$RESOURCES_TO_COPY" / "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
if [[ "${ACTION}" == "install" ]]; then
  rsync -avr --copy-links --no-relative --exclude '*/.svn/*' --files-from="$RESOURCES_TO_COPY" / "${INSTALL_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
fi
rm -f "$RESOURCES_TO_COPY"

if [[ -n "${WRAPPER_EXTENSION}" ]] && [ "`xcrun --find actool`" ] && [ -n $XCASSET_FILES ]
then
  case "${TARGETED_DEVICE_FAMILY}" in
    1,2)
      TARGET_DEVICE_ARGS="--target-device ipad --target-device iphone"
      ;;
    1)
      TARGET_DEVICE_ARGS="--target-device iphone"
      ;;
    2)
      TARGET_DEVICE_ARGS="--target-device ipad"
      ;;
    *)
      TARGET_DEVICE_ARGS="--target-device mac"
      ;;
  esac
  echo $XCASSET_FILES | xargs actool --output-format human-readable-text --notices --warnings --platform "${PLATFORM_NAME}" --minimum-deployment-target "${IPHONEOS_DEPLOYMENT_TARGET}" ${TARGET_DEVICE_ARGS} --compress-pngs --compile "${BUILT_PRODUCTS_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
fi
