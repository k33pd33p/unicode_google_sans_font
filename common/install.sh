FONTDIR=$MODPATH/custom
SYSFONT=$MODPATH/system/fonts
PRDFONT=$MODPATH/system/product/fonts
XML=$MODPATH/system/etc
MODPROP=$MODPATH/module.prop

headline() { cp -rf $FONTDIR/hf/*ttf $SYSFONT; }
body() { cp -rf $FONTDIR/bf/*ttf $SYSFONT; }
condensed() { cp -rf $FONTDIR/cf/*ttf $SYSFONT; }
full() { headline; body; condensed; }
alternative() { cp -rf $FONTDIR/alt/*ttf $SYSFONT; }
text() { cp -rf $FONTDIR/txt/*ttf $SYSFONT; }
original() { cp -rf $FONTDIR/ori/*ttf $SYSFONT; }
bolder() { cp -rf $FONTDIR/bd/*ttf $SYSFONT; }
xml() { cp -rf $FONTDIR/xml/fonts.xml $XML; }
custom() { cp -rf $FONTDIR/system/* $MODPATH/system; }

cleanup() {
	rm -rf $FONTDIR
	rmdir -p $XML $PRDFONT
}

pixel() {
	if [ $API -gt 28 ]; then
		cp -rf $FONTDIR/px/*ttf $PRDFONT
	else 
		cp -rf $FONTDIR/px/*ttf $SYSFONT
	fi
}

oxygen() {
	cp -rf $SYSFONT/Roboto-Black.ttf $SYSFONT/SlateForOnePlus-Black.ttf;
	cp -rf $SYSFONT/Roboto-Bold.ttf $SYSFONT/SlateForOnePlus-Bold.ttf;
	cp -rf $SYSFONT/Roboto-Medium.ttf $SYSFONT/SlateForOnePlus-Medium.ttf;
	cp -rf $SYSFONT/Roboto-Regular.ttf $SYSFONT/SlateForOnePlus-Regular.ttf;
	cp -rf $SYSFONT/Roboto-Regular.ttf $SYSFONT/SlateForOnePlus-Book.ttf;
	cp -rf $SYSFONT/Roboto-Light.ttf $SYSFONT/SlateForOnePlus-Light.ttf;
	cp -rf $SYSFONT/Roboto-Thin.ttf $SYSFONT/SlateForOnePlus-Thin.ttf;
}

miui() {
	cp -rf $FONTDIR/xml/fonts.xml.mi $XML/fonts.xml;
}

# samsung() {
	# cp -rf $SYSFONT/Roboto-Light.ttf $SYSFONT/RobotoNum-3L.ttf;
	# cp -rf $SYSFONT/Roboto-Regular.ttf $SYSFONT/RobotoNum-3R.ttf;
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
ui_print "  4. Pixel"
ui_print "   "
ui_print "  Select:"
while true; do
	ui_print "  $ROM"
	if $VKSEL; then
		ROM=$((ROM + 1))
	else 
		break
	fi
	if [ $ROM -gt 4 ]; then
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
mkdir -p $SYSFONT $XML $PRDFONT

case $WHERE in
	1 ) full;;
	2 ) headline; sed -ie 3's/$/-hf&/' $MODPROP;;
	3 ) headline; body; sed -ie 3's/$/-hbf&/' $MODPROP;;
esac

case $STYLE in
	2 ) alternative; sed -ie 3's/$/-alt&/' $MODPROP;;
	3 ) text; sed -ie 3's/$/-txt&/' $MODPROP;;
	4 ) original; sed -ie 3's/$/-ori&/' $MODPROP;;
	5 ) bolder; sed -ie 3's/$/-bd&/' $MODPROP;;
esac

case $ROM in
	2 ) oxygen; sed -ie 3's/$/-oos&/' $MODPROP;;
	3 ) miui; sed -ie 3's/$/-mi&/' $MODPROP;;
	# 4 ) samsung; sed -ie 3's/$/-ss&/' $MODPROP;;
	4 ) pixel; sed -ie 3's/$/-px&/' $MODPROP;;
esac

if $XML; then
	xml; sed -ie 3's/$/-xml&/' $MODPROP;
fi

if [ -d $FONTDIR/system ]; then
	ui_print "   "
	ui_print "- Copying custom files"
	custom; sed -ie 3's/$/-cust&/' $MODPROP
fi

### CLEAN UP ###
ui_print "   "
ui_print "- Cleaning up"
cleanup

ui_print "   "
