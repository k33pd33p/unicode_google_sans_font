hf () { cp -r $INSTALLER/custom/HF/* $INSTALLER/system/fonts; }
bf () { cp -r $INSTALLER/custom/BF/* $INSTALLER/system/fonts; }
cf () { cp -r $INSTALLER/custom/CF/* $INSTALLER/system/fonts; }
full () { hf; bf; cf; }
alt () { cp -r $INSTALLER/custom/alt/* $INSTALLER/system/fonts; }
orig () { cp -r $INSTALLER/custom/orig/* $INSTALLER/system/fonts; }
xml () { cp -r $INSTALLER/custom/xml/* $INSTALLER/system/; }

PART=1
VER=1
XML=false

# 1st selection ---------------------------------------- 
echo "
Which part of the system font do you want to replace?
Vol+ = Select; Vol- = Ok

1. Full
2. Headline
3. Headline/Body
"
echo "Select:"
OK=true
while $OK; do
	echo "$PART"
	if $VKSEL; then
		PART=$((PART + 1))
	else 
		OK=false
	fi
	if [ $PART -gt 3 ]; then
		PART=1
	fi
done

echo -e "\nSelected:\n$PART\n"

# 2nd selection ---------------------------------------- 
echo "
Which version do you want to install?
Vol+ = Select; Vol- = OK

1. Default
2. Alternative
3. Original
"

echo "Select:"
OK=true
while $OK; do
	echo "$VER"
	if $VKSEL; then
		VER=$((VER + 1))
	else 
		OK=false
	fi
	if [ $VER -gt 3 ]; then
		VER=1
	fi
done

echo -e "\nSelected:\n$VER\n"

# 3rd selection ---------------------------------------- 
echo "Include fontxml?
Vol+ = Yes; Vol- = No
"
if $VKSEL; then
	XML=true	
	echo -e "Selected:\nYes"
else
	echo -e "Selected:\nNo"	
fi

# installation  ---------------------------------------- 
case $PART in
	1 ) full;;
	2 ) hf;;
	3 ) hf; bf;;
esac

case $VER in
	2 ) alt;;
	3 ) orig;;
esac

if $XML; then
	xml
fi

echo ""
