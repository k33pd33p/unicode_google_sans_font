hf () { cp -R $INSTALLER/custom/hf/* $INSTALLER/system/fonts; }
bf () { cp -R $INSTALLER/custom/bf/* $INSTALLER/system/fonts; }
cf () { cp -R $INSTALLER/custom/cf/* $INSTALLER/system/fonts; }
full () { hf; bf; cf; }
alt () { cp -R $INSTALLER/custom/alt/* $INSTALLER/system/fonts; }
orig () { cp -R $INSTALLER/custom/orig/* $INSTALLER/system/fonts; }
xml () { cp -R $INSTALLER/custom/xml/* $INSTALLER/system/; }
cust () { cp -R $INSTALLER/custom/system/* $INSTALLER/system/; }

# 1st selection ---------------------------------------- 
PART=1
ui_print " "
ui_print "- Which part of the system font do you want to replace?"
ui_print "  Vol+ = Select; Vol- = Ok"
ui_print " "
ui_print "  1. Full"
ui_print "  2. Headline"
ui_print "  3. Headline/Body"
ui_print " "
ui_print "  Select:"
while true; do
	ui_print "  $PART"
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
ui_print "  Selected: $PART"

# 2nd selection ---------------------------------------- 
VER=1
if [ $PART != 2 ]; then
	ui_print " "
	ui_print "- Which version do you want to install?"
	ui_print "  Vol+ = Select; Vol- = OK"
	ui_print " "
	ui_print "  1. Default"
	ui_print "  2. Alternative"
	ui_print "  3. Original"
	ui_print " "

	ui_print "  Select:"
	while true; do
		ui_print "  $VER"
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
	ui_print "  Selected: $VER"
fi

# 3rd selection ---------------------------------------- 
XML=false
ui_print " "
ui_print "- Include fontxml?"
ui_print "  Vol+ = Yes; Vol- = No/Not Sure"
ui_print " "
if $VKSEL; then
	XML=true	
	ui_print "  Selected: Yes"
else
	ui_print "  Selected: No"	
fi

# installation  ---------------------------------------- 
case $PART in
	1 ) full;;
	2 ) hf; sed -ie 3's/$/-hf&/' $INSTALLER/module.prop;;
	3 ) hf; bf; sed -ie 3's/$/-hbf&/' $INSTALLER/module.prop;;
esac

case $VER in
	2 ) alt; sed -ie 3's/$/-alt&/' $INSTALLER/module.prop;;
	3 ) orig; sed -ie 3's/$/-orig&/' $INSTALLER/module.prop;;
esac

if $XML; then
	xml; sed -ie 3's/$/-xml&/' $INSTALLER/module.prop;
fi

if [ -n "$(ls -A $INSTALLER/custom/system)" ]; then
	ui_print " "
	ui_print "- Copying custom files"
	cust; sed -ie 3's/$/-cust&/' $INSTALLER/module.prop
fi

ui_print " "
