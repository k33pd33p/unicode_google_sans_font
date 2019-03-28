headline_font() { cp -rf $INSTALLER/custom/hf/* $INSTALLER/system/fonts; }
body_font() { cp -rf $INSTALLER/custom/bf/* $INSTALLER/system/fonts; }
condensed_font() { cp -rf $INSTALLER/custom/cf/* $INSTALLER/system/fonts; }
full_font() { headline_font; body_font; condensed_font; }
alternative_font() { cp -rf $INSTALLER/custom/alt/* $INSTALLER/system/fonts; }
original_font() { cp -rf $INSTALLER/custom/orig/* $INSTALLER/system/fonts; }
font_xml() { cp -rf $INSTALLER/custom/xml/* $INSTALLER/system/; }
custom_font() { cp -rf $INSTALLER/custom/system/* $INSTALLER/system/; }

### SELECTIONS ###

PART=1
ui_print "_____________________________________________________"
ui_print " "
ui_print "Which part of the system font do you want to replace?"
ui_print "Vol+ = Select; Vol- = Ok"
ui_print " "
ui_print "1. Full"
ui_print "2. Headline"
ui_print "3. Headline/Body"
ui_print " "
ui_print "Select:"
while true; do
	ui_print "$PART"
	if $VKSEL; then
		PART=$((PART + 1))
	else 
		break
	fi
	if [ $PART -gt 3 ]; then
		PART=1
	fi
done
ui_print " "
ui_print "Selected: $PART"

VER=1
if [ $PART -ne 2 ]; then
	ui_print "_____________________________________________________"
	ui_print " "
	ui_print "Which version do you want to install?"
	ui_print "Vol+ = Select; Vol- = OK"
	ui_print " "
	ui_print "1. Default"
	ui_print "2. Alternative"
	ui_print "3. Original"
	ui_print " "
	ui_print "Select:"
	while true; do
		ui_print "$VER"
		if $VKSEL; then
			VER=$((VER + 1))
		else 
			break
		fi
		if [ $VER -gt 3 ]; then
			VER=1
		fi
	done
	ui_print " "
	ui_print "Selected: $VER"
fi

XML=false
ui_print "_____________________________________________________"
ui_print " "
ui_print "Include fontxml?"
ui_print "Vol+ = Yes; Vol- = No/Not Sure"
ui_print " "
if $VKSEL; then
	XML=true	
	ui_print "Selected: Yes"
else
	ui_print "Selected: No"	
fi

### INSTALLATION ###

case $PART in
	1 ) full_font;;
	2 ) headline_font; sed -ie 3's/$/-hf&/' $INSTALLER/module.prop;;
	3 ) headline_font; body_font; sed -ie 3's/$/-hbf&/' $INSTALLER/module.prop;;
esac

case $VER in
	2 ) alternative_font; sed -ie 3's/$/-alt&/' $INSTALLER/module.prop;;
	3 ) original_font; sed -ie 3's/$/-orig&/' $INSTALLER/module.prop;;
esac

if $XML; then
	font_xml; sed -ie 3's/$/-xml&/' $INSTALLER/module.prop;
fi

if [ -n "$(ls -A $INSTALLER/custom/system)" ]; then
	ui_print " "
	ui_print "- Copying custom files"
	custom_font; sed -ie 3's/$/-cust&/' $INSTALLER/module.prop
fi
ui_print "_______________________________________________"
ui_print " "
