FONTDIR=$MODPATH/custom
SYSFONT=$MODPATH/system/fonts
PRDFONT=$MODPATH/system/product/fonts
SYSETC=$MODPATH/system/etc
SYSXML=$SYSETC/fonts.xml
MODPROP=$MODPATH/module.prop

headline() { cp $FONTDIR/hf/*ttf $SYSFONT; }
body() { cp $FONTDIR/bf/*ttf $SYSFONT; }
condensed() { cp $FONTDIR/cf/*ttf $SYSFONT; }
full() { headline; body; condensed; }
alternative() { cp $FONTDIR/alt/*ttf $SYSFONT; }
text() { cp $FONTDIR/txt/*ttf $SYSFONT; }
original() { cp $FONTDIR/ori/*ttf $SYSFONT; }
bolder() { cp $FONTDIR/bd/*ttf $SYSFONT; }
tnum() { cp $FONTDIR/bf/tnum/*ttf $SYSFONT; }
xml() { cp $FONTDIR/xml/fonts.xml $SYSXML; }
custom() { cp -rf $FONTDIR/system/* $MODPATH/system; }

cleanup() {
	rm -rf $FONTDIR
	rmdir -p $SYSETC $PRDFONT
}

pixel() {
	if [ $API -gt 28 ]; then
		cp $FONTDIR/px/*ttf $PRDFONT
	else 
		cp $FONTDIR/px/*ttf $SYSFONT
	fi
}

oxygen() {
	cp $SYSFONT/Roboto-Black.ttf $SYSFONT/SlateForOnePlus-Black.ttf;
	cp $SYSFONT/Roboto-Bold.ttf $SYSFONT/SlateForOnePlus-Bold.ttf;
	cp $SYSFONT/Roboto-Medium.ttf $SYSFONT/SlateForOnePlus-Medium.ttf;
	cp $SYSFONT/Roboto-Regular.ttf $SYSFONT/SlateForOnePlus-Regular.ttf;
	cp $SYSFONT/Roboto-Regular.ttf $SYSFONT/SlateForOnePlus-Book.ttf;
	cp $SYSFONT/Roboto-Light.ttf $SYSFONT/SlateForOnePlus-Light.ttf;
	cp $SYSFONT/Roboto-Thin.ttf $SYSFONT/SlateForOnePlus-Thin.ttf;
}

miui() {
	umount /system/etc/fonts.xml 
	cp /system/etc/fonts.xml $SYSXML
	sed -i '1,/MiLanProVF/s/MiLanProVF/Roboto-Regular/' $SYSXML; sed -i '1,/stylevalue/{/stylevalue/d}' $SYSXML
	sed -i '1,/MiLanProVF/s/MiLanProVF/Roboto-Bold/' $SYSXML; sed -i '1,/stylevalue/{/stylevalue/d}' $SYSXML
	sed -i '1,/MiLanProVF/s/MiLanProVF/Roboto-Thin/' $SYSXML; sed -i '1,/stylevalue/{/stylevalue/d}' $SYSXML
	sed -i '1,/MiLanProVF/s/MiLanProVF/Roboto-Light/' $SYSXML; sed -i '1,/stylevalue/{/stylevalue/d}' $SYSXML
	sed -i '1,/MiLanProVF/s/MiLanProVF/Roboto-Light/' $SYSXML; sed -i '1,/stylevalue/{/stylevalue/d}' $SYSXML
	sed -i '1,/MiLanProVF/s/MiLanProVF/Roboto-Regular/' $SYSXML; sed -i '1,/stylevalue/{/stylevalue/d}' $SYSXML
	sed -i '1,/MiLanProVF/s/MiLanProVF/Roboto-Regular/' $SYSXML; sed -i '1,/stylevalue/{/stylevalue/d}' $SYSXML
	sed -i '1,/MiLanProVF/s/MiLanProVF/Roboto-Medium/' $SYSXML; sed -i '1,/stylevalue/{/stylevalue/d}' $SYSXML
	sed -i '1,/MiLanProVF/s/MiLanProVF/Roboto-Medium/' $SYSXML; sed -i '1,/stylevalue/{/stylevalue/d}' $SYSXML
	sed -i '1,/MiLanProVF/s/MiLanProVF/Roboto-Bold/' $SYSXML; sed -i '1,/stylevalue/{/stylevalue/d}' $SYSXML
	sed -i '1,/MiLanProVF/s/MiLanProVF/Roboto-Regular/' $SYSXML; sed -i '1,/stylevalue/{/stylevalue/d}' $SYSXML
	sed -i '1,/MiLanProVF/s/MiLanProVF/Roboto-Bold/' $SYSXML; sed -i '1,/stylevalue/{/stylevalue/d}' $SYSXML
	sed -i '1,/MiLanProVF/s/MiLanProVF/Roboto-Thin/' $SYSXML; sed -i '1,/stylevalue/{/stylevalue/d}' $SYSXML
	sed -i '1,/MiLanProVF/s/MiLanProVF/Roboto-Light/' $SYSXML; sed -i '1,/stylevalue/{/stylevalue/d}' $SYSXML
	sed -i '1,/MiLanProVF/s/MiLanProVF/Roboto-Thin/' $SYSXML; sed -i '1,/stylevalue/{/stylevalue/d}' $SYSXML
	sed -i '1,/MiLanProVF/s/MiLanProVF/Roboto-Light/' $SYSXML; sed -i '1,/stylevalue/{/stylevalue/d}' $SYSXML
	sed -i '1,/MiLanProVF/s/MiLanProVF/Roboto-Light/' $SYSXML; sed -i '1,/stylevalue/{/stylevalue/d}' $SYSXML
	sed -i '1,/MiLanProVF/s/MiLanProVF/Roboto-Regular/' $SYSXML; sed -i '1,/stylevalue/{/stylevalue/d}' $SYSXML
	sed -i '1,/MiLanProVF/s/MiLanProVF/Roboto-Light/' $SYSXML; sed -i '1,/stylevalue/{/stylevalue/d}' $SYSXML
	sed -i '1,/MiLanProVF/s/MiLanProVF/Roboto-Regular/' $SYSXML; sed -i '1,/stylevalue/{/stylevalue/d}' $SYSXML
	sed -i '1,/MiLanProVF/s/MiLanProVF/Roboto-Regular/' $SYSXML; sed -i '1,/stylevalue/{/stylevalue/d}' $SYSXML
	sed -i '1,/MiLanProVF/s/MiLanProVF/Roboto-Medium/' $SYSXML; sed -i '1,/stylevalue/{/stylevalue/d}' $SYSXML
	sed -i '1,/MiLanProVF/s/MiLanProVF/Roboto-Medium/' $SYSXML; sed -i '1,/stylevalue/{/stylevalue/d}' $SYSXML
	sed -i '1,/MiLanProVF/s/MiLanProVF/Roboto-Bold/' $SYSXML; sed -i '1,/stylevalue/{/stylevalue/d}' $SYSXML
	sed -i '1,/MiLanProVF/s/MiLanProVF/Roboto-Medium/' $SYSXML; sed -i '1,/stylevalue/{/stylevalue/d}' $SYSXML
	sed -i '1,/MiLanProVF/s/MiLanProVF/Roboto-Bold/' $SYSXML; sed -i '1,/stylevalue/{/stylevalue/d}' $SYSXML
	sed -i '1,/MiLanProVF/s/MiLanProVF/Roboto-Medium/' $SYSXML; sed -i '1,/stylevalue/{/stylevalue/d}' $SYSXML
	sed -i '1,/MiLanProVF/s/MiLanProVF/Roboto-Bold/' $SYSXML; sed -i '1,/stylevalue/{/stylevalue/d}' $SYSXML
	sed -i '1,/MiLanProVF/s/MiLanProVF/Roboto-Bold/' $SYSXML; sed -i '1,/stylevalue/{/stylevalue/d}' $SYSXML
	sed -i '1,/MiLanProVF/s/MiLanProVF/Roboto-Black/' $SYSXML; sed -i '1,/stylevalue/{/stylevalue/d}' $SYSXML
	sed -i '1,/MiLanProVF/s/MiLanProVF/Roboto-Black/' $SYSXML; sed -i '1,/stylevalue/{/stylevalue/d}' $SYSXML
}

# samsung() {
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

STYLE=0
if [ $WHERE -ne 2 ]; then
	STYLE=1
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

TNUM=false
if [ $STYLE -eq 1 ]; then
	ui_print "   "
	ui_print "- Tabular Figures?"
	ui_print "  Vol+ = Yes; Vol- = No/Absolutely Not"
	ui_print "   "
	if $VKSEL; then
		TNUM=true	
		ui_print "  Selected: Yes"
	else
		ui_print "  Selected: No"	
	fi
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
mkdir -p $SYSFONT $SYSETC $PRDFONT

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

if $TNUM; then
	tnum; sed -ie 3's/$/-tnum&/' $MODPROP;
fi

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
