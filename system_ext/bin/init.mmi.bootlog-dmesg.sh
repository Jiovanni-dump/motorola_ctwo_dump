#!/system/bin/sh
#
# Copyright (c) 2023, Motorola LLC  All rights reserved.
#

scriptname=${0##*/}

debug()
{
	echo "$*"
}

notice()
{
	echo "$*"
	echo "$scriptname: $*" > /dev/kmsg
}

allow_to_run()
{
	secure_hw=$(getprop ro.boot.secure_hardware)
	build_type=$(getprop ro.build.type)
	cid=$(getprop ro.vendor.boot.cid)

	if [ x"$securehw" == x"1" ] && [ x"$buildtype" == x"user" ] && [ x"$(($cid))" != x"0x0" ] && [ x"$(($cid))" != x"0x0000" ]; then
		apdp_state=$(getprop ro.boot.device_apdp_state)
		aplogd_state=$(getprop ro.boot.ro.boot.force_aplogd_enable)
		if [ "$apdp_state" == "1" ] || [ "$aplogd_state" == "1" ]; then
			notice "secure_hw=$secure_hw build_type=$build_type cid=$cid apdp_state=$apdp_state aplogd_state=$aplogd_state"
			return
		fi
		exit 0
	fi
}

KERNEL_LOGFILE_PREFIX="/mnt/product/logks/dmesglog"
POSTFIX=".log"

# mv files.x-1 to files.x
mv_files()
{
	if [ -z "$1" ]; then
	  echo "No file name!"
	  return
	fi
	if [ -z "$2" ]; then
	  LAST_FILE=3
	else
	  LAST_FILE=$2
	fi

	#echo $1 $2 $LAST_FILE
	i=$LAST_FILE
	while [ $i -gt 0 ]; do
	  prev=$(($i-1))
	  if [ -e "$1.$prev$POSTFIX" ]; then
#	    echo mv $1.$prev $1.$i
	    mv $1.$prev$POSTFIX $1.$i$POSTFIX
	  fi
	  i=$(($i-1))
	done

	if [ -e $1$POSTFIX ]; then
	  #echo mv $1 $1.1
	  mv $1$POSTFIX $1.1$POSTFIX
	fi
}

while [ ! -e "/mnt/product/logks/lost+found" ]; do
	sleep 1
	notice "logks partition is not mounted, wait to try"
done

if [ -e ${KERNEL_LOGFILE_PREFIX}$POSTFIX ]; then
	mv_files $KERNEL_LOGFILE_PREFIX 1
fi

allow_to_run

dmesg -w > ${KERNEL_LOGFILE_PREFIX}$POSTFIX

