#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}
LOGFILE=/cache/magisk.log
MODNAME=${MODDIR#/magisk/}
MOUNTPOINT=/magisk
COREDIR=$MOUNTPOINT/.core
buildname="custom_build.prop"
PROPLIST=`find $MODDIR -maxdepth 1 -type f ! -name "module.prop" ! -name "system.prop" -name "*.prop" 2>/dev/null | sort -d`

RESETPROP="/data/magisk/resetprop"
if [ -f "$COREDIR/bin/resetprop" ]; then
  RESETPROP="$COREDIR/bin/resetprop"
fi

log_print() {
  echo "$MODNAME: $1"
  echo "$MODNAME: $1" >> $LOGFILE
  log -p i -t "$MODNAME" "$1"
}

# This script will be executed in late_start service mode
# More info in the main Magisk thread

if [ ! -f "$MODDIR/system.prop" ]; then
  if [ ! -z "$PROPLIST" ]; then
    for ITEM in $PROPLIST; do
      log_print "setting props through $ITEM"
      "$RESETPROP" --file "$ITEM"
    done
  elif [ -f "/magisk/tweakprop/$buildname" ]; then
    log_print "setting props through /magisk/tweakprop/$buildname"
    "$RESETPROP" --file "/magisk/tweakprop/$buildname"
  else
    # Set any prop (with trigger)
    log_print "setting props through servie.sh"
    "$RESETPROP" * *
  fi
  log_print "Resetprop done. $(date +"%m-%d-%Y %H:%M:%S")"
fi
