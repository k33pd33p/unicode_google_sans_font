headline() { cp -rf $MODPATH/custom/hf/*ttf $MODPATH/system/fonts; }
body() { cp -rf $MODPATH/custom/bf/*ttf $MODPATH/system/fonts; }
condensed() { cp -rf $MODPATH/custom/cf/*ttf $MODPATH/system/fonts; }
full() { headline; body; condensed; }
alternative() { cp -rf $MODPATH/custom/alt/*ttf $MODPATH/system/fonts; }
text() { cp -rf $MODPATH/custom/txt/*ttf $MODPATH/system/fonts; }
original() { cp -rf $MODPATH/custom/ori/*ttf $MODPATH/system/fonts; }
bolder() { cp -rf $MODPATH/custom/bd/*ttf $MODPATH/system/fonts; }
xml() { cp -rf $MODPATH/custom/xml/fonts.xml $MODPATH/system/etc; }
custom() { cp -rf $MODPATH/custom/system/* $MODPATH/system/; }

pixel() { cp -rf $MODPATH/custom/px/*ttf $MODPATH/system/product/fonts; }

oxygen() {
	cp -rf $MODPATH/system/fonts/Roboto-Black.ttf $MODPATH/system/fonts/SlateForOnePlus-Black.ttf;
	cp -rf $MODPATH/system/fonts/Roboto-Bold.ttf $MODPATH/system/fonts/SlateForOnePlus-Bold.ttf;
	cp -rf $MODPATH/system/fonts/Roboto-Medium.ttf $MODPATH/system/fonts/SlateForOnePlus-Medium.ttf;
	cp -rf $MODPATH/system/fonts/Roboto-Regular.ttf $MODPATH/system/fonts/SlateForOnePlus-Regular.ttf;
	cp -rf $MODPATH/system/fonts/Roboto-Regular.ttf $MODPATH/system/fonts/SlateForOnePlus-Book.ttf;
	cp -rf $MODPATH/system/fonts/Roboto-Light.ttf $MODPATH/system/fonts/SlateForOnePlus-Light.ttf;
	cp -rf $MODPATH/system/fonts/Roboto-Thin.ttf $MODPATH/system/fonts/SlateForOnePlus-Thin.ttf;
}

miui() {
	cp -rf $MODPATH/custom/xml/fonts.xml.mi $MODPATH/system/etc/fonts.xml;
}

# samsung() {
	# cp -rf $MODPATH/system/fonts/Roboto-Light.ttf $MODPATH/system/fonts/RobotoNum-3L.ttf;
	# cp -rf $MODPATH/system/fonts/Roboto-Regular.ttf $MODPATH/system/fonts/RobotoNum-3R.ttf;
# }

### SELECTIONS ###

WHERE=1
ui_print "   "
ui_print "- WHERE to install?"
ui_print "  Vol+ = Select; Vol- = Ok"
ui_print "   "
ui_print "  1. Full"
ui_print "  2. Headline"
ui_print "  3. Headline/Body"
ui_print "   "
ui_print "  Select:"
while true; do
	ui_print "  $WHERE"
	if $VKSEL; then
		WHERE=$((WHERE + 1))
	else 
		break
	fi
	if [ $WHERE -gt 3 ]; then
		WHERE=1
	fi
done
ui_print "   "
ui_print "  Selected: $WHERE"

STYLE=1
if [ $WHERE -ne 2 ]; then
	ui_print "   "
	ui_print "- Which STYLE?"
	ui_print "  Vol+ = Select; Vol- = OK"
	ui_print "   "
	ui_print "  1. Default"
	ui_print "  2. Alternative"
	ui_print "  3. Text"
	ui_print "  4. Original"
	ui_print "  5. Bolder"
	ui_print "   "
	ui_print "  Select:"
	while true; do
		ui_print "  $STYLE"
		if $VKSEL; then
			STYLE=$((STYLE + 1))
		else 
			break
		fi
		if [ $STYLE -gt 5 ]; then
			STYLE=1
		fi
	done
	ui_print "   "
	ui_print "  Selected: $STYLE"
fi

ROM=1
ui_print "   "
ui_print "- ROM?"
ui_print "  Vol+ = Select; Vol- = Ok"
ui_print "   "
ui_print "  1. AOSP/LOS"
ui_print "  2. Oxygen OS"
ui_print "  3. MIUI 11"
# ui_print "  4. Samsung"
# ui_print "  5. Pixel"
ui_print "   "
ui_print "  Select:"
while true; do
	ui_print "  $ROM"
	if $VKSEL; then
		ROM=$((ROM + 1))
	else 
		break
	fi
	if [ $ROM -gt 3 ]; then
		ROM=1
	fi
done
ui_print "   "
ui_print "  Selected: $ROM"

XML=false
ui_print "   "
ui_print "- Use Android default font reference?"
ui_print "  Vol+ = Yes; Vol- = No/Not Sure"
ui_print "   "
if $VKSEL; then
	XML=true	
	ui_print "  Selected: Yes"
else
	ui_print "  Selected: No"	
fi

### INSTALLATION ###
mkdir -p $MODPATH/system/fonts $MODPATH/system/etc $MODPATH/system/product/fonts

case $WHERE in
	1 ) full;;
	2 ) headline; sed -ie 3's/$/-hf&/' $MODPATH/module.prop;;
	3 ) headline; body; sed -ie 3's/$/-hbf&/' $MODPATH/module.prop;;
esac

case $STYLE in
	2 ) alternative; sed -ie 3's/$/-alt&/' $MODPATH/module.prop;;
	3 ) text; sed -ie 3's/$/-txt&/' $MODPATH/module.prop;;
	4 ) original; sed -ie 3's/$/-ori&/' $MODPATH/module.prop;;
	5 ) bolder; sed -ie 3's/$/-bd&/' $MODPATH/module.prop;;
esac

case $ROM in
	2 ) oxygen; sed -ie 3's/$/-oos&/' $MODPATH/module.prop;;
	3 ) miui; sed -ie 3's/$/-mi&/' $MODPATH/module.prop;;
	# 4 ) samsung; sed -ie 3's/$/-ss&/' $MODPATH/module.prop;;
	# 5 ) pixel; sed -ie 3's/$/-px&/' $MODPATH/module.prop;;
esac

if $XML; then
	xml; sed -ie 3's/$/-xml&/' $MODPATH/module.prop;
fi

if [ -d $MODPATH/custom/system ]; then
	ui_print "   "
	ui_print "- Copying custom files"
	custom; sed -ie 3's/$/-cust&/' $MODPATH/module.prop
fi

### CLEAN UP ###
ui_print "   "
ui_print "- Cleaning up"
rm -rf $MODPATH/custom

ui_print "   "
