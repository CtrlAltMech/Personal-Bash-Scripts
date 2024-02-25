#!/bin/bash

# Converts decimal to hex
dec_hex=$(printf '%x\n' $1 2>/dev/null)
username="<ENTER YOUR IDRAC USERNAME HERE BETWEEN THE QUOTES>"
pw="<ENTER YOUR IDRAC PASSWORD HERE BETWEEN THE QUOTES>"
idip="<ENTER YOUR IDRAC IP BETWEEN THE QUOTES>"

if [[ $1 -lt 100 ]] && [[ $1 -gt 20 ]]; then

	# Sets the fan speed manually to requested value
	ipmitool -I lanplus -H $idip -U $username -P $pw raw 0x30 0x30 0x02 0xff 0x$dec_hex

	# Lets the user know what they have done
	echo "$USER has set the fan speed to $1%."
else
	echo "Enter a number between 20 and 100."
fi
