#!/vendor/bin/sh

SCRIPT_NAME="copy_qc_cert.sh"
WV_SRC="/vendor/etc/qcom_widevine_licenses.pfm"
WV_DEST="/mnt/vendor/persist/data/pfm/licenses/qcom_widevine_licenses.pfm"
SECURE_PROP="ro.boot.secure_hardware"
WV_COPIED="/mnt/vendor/persist/data/pfm/licenses/.wv_copy_done"
GPS_COPIED="/mnt/vendor/persist/data/pfm/licenses/.gps_copy_done"
GPS_CERT="/mnt/vendor/persist/data/pfm/licenses/898-898-no-exp-2574099444.pfm"

SMART_TRANSMIT_SRC="/vendor/etc/qcom_smart_transmit_licenses.pfm"
SMART_TRANSMIT_COPIED="/mnt/vendor/persist/data/pfm/licenses/.smart_transmit_copy_done"
SMART_TRANSMIT_DEST="/mnt/vendor/persist/data/pfm/licenses/qcom_smart_transmit_licenses.pfm"

WV_CERT_CHECKSUM="b5f9275aa997e4754b4131c6c07eb697"
SMART_TRANSMIT_CERT_CHECKSUM="8649a72904b07a44eb79bc50743e2886"

debug()
{
    echo "Debug: $*"
}

notice()
{
    echo "Debug: $*"
    echo "$SCRIPT_NAME: $*" > /dev/kmsg
}


reinstall_wv_cert()
{
	notice "copy widevine to perist start:"
	cp $WV_SRC $WV_DEST
    if [ "$?" == "0" ]
    then
	    echo "2" > $WV_COPIED
	    notice "copy widevine to perist done"
    fi
}

reinstall_gps_cert()
{
    notice "start re-instsll gps cert"
    mv "$GPS_CERT".inst "$GPS_CERT"
    if [ "$?" == "0" ]
    then
        echo "2" > $GPS_COPIED
        notice "re-instsll gps cert done"
    fi
}

reinstall_smart_transmit_cert()
{
    notice "copy smart transmit cert to perist start:"
    cp $SMART_TRANSMIT_SRC $SMART_TRANSMIT_DEST
    if [ "$?" == "0" ]
    then
        echo "2" > $SMART_TRANSMIT_COPIED
        notice "copy smart transmit cert to perist done"
    fi
}

current_md5=`md5sum $WV_DEST.inst | cut -d" " -f1`
notice "current_md5:$current_md5"
notice "wv_cert_checksum:$WV_CERT_CHECKSUM"

if [ -f $WV_COPIED ]
then
    WV_COPIED_LABEL=`cat $WV_COPIED`
    if [[ "$WV_COPIED_LABEL" == "2" && "$current_md5" == "$WV_CERT_CHECKSUM" ]]
    then
        notice "widevine licenses is already re-installed!"
    else
        notice "remove old widevine licenses"
        rm /mnt/vendor/persist/data/pfm/licenses/.wv_copy_done
        rm /mnt/vendor/persist/data/pfm/licenses/qcom_widevine_licenses.pfm.inst
        reinstall_wv_cert
    fi
else
    reinstall_wv_cert
fi

GPS_COPIED_LABEL=`cat $GPS_COPIED`
if [[ -f "$GPS_CERT".inst && "$GPS_COPIED_LABEL" != "2" ]]
then
    reinstall_gps_cert
fi


current_smart_transmit_md5=`md5sum $SMART_TRANSMIT_DEST.inst | cut -d" " -f1`
notice "current_smart_transmit_md5:$current_smart_transmit_md5"
notice "smart_transmit_cert_checksum:$SMART_TRANSMIT_CERT_CHECKSUM"

if [ -f $SMART_TRANSMIT_COPIED ]
then
    SMART_TRANSMIT_COPIED_LABEL=`cat $SMART_TRANSMIT_COPIED`
    if [[ "$SMART_TRANSMIT_COPIED_LABEL" == "2" && "$current_smart_transmit_md5" == "$SMART_TRANSMIT_CERT_CHECKSUM" ]]
    then
        notice "smart transmit licenses is already re-installed!"
    else
        notice "remove old smart transmit licenses"
        rm /mnt/vendor/persist/data/pfm/licenses/.smart_transmit_copy_done
        rm /mnt/vendor/persist/data/pfm/licenses/qcom_smart_transmit_licenses.pfm.inst
        reinstall_smart_transmit_cert
    fi
else
    reinstall_smart_transmit_cert
fi


fsync $WV_COPIED
fsync $WV_DEST
fsync $GPS_CERT
fsync $GPS_COPIED
fsync $SMART_TRANSMIT_COPIED
fsync $SMART_TRANSMIT_DEST
