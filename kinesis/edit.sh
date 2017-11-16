#/bin/bash
# This script makes it easy to edit your Kinesis
# configuration on Linux.

# Mount the keyboard
device=$(lsblk | grep 2M | cut -d' ' -f1)
if [ -z "$device" ]; then
  echo "Keyboard not connected."
  exit 0
fi

sudo mkdir -p /media/kinesis
sudo mount /dev/$device /media/kinesis
sudo vim /media/kinesis/active/d_qwerty.txt
sudo cp /media/kinesis/active/*_qwerty.txt .
sudo umount /media/kinesis
