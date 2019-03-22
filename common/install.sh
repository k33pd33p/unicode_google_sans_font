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
ui_print " "
ui_print "Which part of the system font do you want to replace?"
ui_print "Vol+ = Select; Vol- = Ok"
ui_print " "
ui_print "1. Full"
ui_print "2. Headline"
ui_print "3. Headline/Body"
ui_print " "
ui_print "Select:"
OK=true
while $OK; do
	ui_print "$PART"
	if $VKSEL; then
		PART=$((PART + 1))
	else 
		OK=false
	fi
	if [ $PART -gt 3 ]; then
		PART=1
	fi
done

ui_print " "
ui_print "Selected: $PART"

# 2nd selection ---------------------------------------- 
ui_print " "
ui_print "Which version do you want to install?"
ui_print "Vol+ = Select; Vol- = OK"
ui_print " "
ui_print "1. Default"
ui_print "2. Alternative"
ui_print "3. Original"
ui_print " "

ui_print "Select:"
OK=true
while $OK; do
	ui_print "$VER"
	if $VKSEL; then
		VER=$((VER + 1))
	else 
		OK=false
	fi
	if [ $VER -gt 3 ]; then
		VER=1
	fi
done

ui_print " "
ui_print "Selected: $VER"

# 3rd selection ---------------------------------------- 
ui_print " "
ui_print "Include fontxml?"
ui_print "Vol+ = Yes; Vol- = No"
ui_print " "
if $VKSEL; then
	XML=true	
	ui_print "Selected: Yes"
else
	ui_print "Selected: No"	
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

ui_print " "
