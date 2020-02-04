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
text() {
	cp $FONTDIR/txt/bf/*ttf $SYSFONT
	cp $FONTDIR/txt/cf/*ttf $SYSFONT
	if $TXTHF; then
		cp $FONTDIR/txt/hf/*ttf $SYSFONT
	fi
}
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
	DEST=$PRDFONT
	if [ $API -lt 29 ]; then
		DEST=$SYSFONT
	fi
	if $TXTHF; then
		cp $SYSFONT/Roboto-Regular.ttf $DEST/GoogleSans-Regular.ttf
		cp $SYSFONT/Roboto-Italic.ttf $DEST/GoogleSans-Italic.ttf
		cp $SYSFONT/Roboto-Medium.ttf $DEST/GoogleSans-Medium.ttf
		cp $SYSFONT/Roboto-MediumItalic.ttf $DEST/GoogleSans-MediumItalic.ttf
		cp $SYSFONT/Roboto-Bold.ttf $DEST/GoogleSans-Bold.ttf
		cp $SYSFONT/Roboto-BoldItalic.ttf $DEST/GoogleSans-BoldItalic.ttf
	else
		cp $FONTDIR/px/*ttf $DEST
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
	if i=$(grep miui $SYSXML); then
		sed -i '/\"miui\"/,/stylevalue/{s/MiLanProVF/Roboto-Regular/;/stylevalue/d}' $SYSXML
		sed -i '/\"miui\"/,/stylevalue/{s/MiLanProVF/Roboto-Bold/;/stylevalue/d}' $SYSXML
		sed -i '/\"miui-thin\"/,/stylevalue/{s/MiLanProVF/Roboto-Thin/;/stylevalue/d}' $SYSXML
		sed -i '/\"miui-thin\"/,/stylevalue/{s/MiLanProVF/Roboto-Light/;/stylevalue/d}' $SYSXML
		sed -i '/\"miui-light\"/,/stylevalue/{s/MiLanProVF/Roboto-Light/;/stylevalue/d}' $SYSXML
		sed -i '/\"miui-light\"/,/stylevalue/{s/MiLanProVF/Roboto-Regular/;/stylevalue/d}' $SYSXML
		sed -i '/\"miui-regular\"/,/stylevalue/{s/MiLanProVF/Roboto-Regular/;/stylevalue/d}' $SYSXML
		sed -i '/\"miui-regular\"/,/stylevalue/{s/MiLanProVF/Roboto-Medium/;/stylevalue/d}' $SYSXML
		sed -i '/\"miui-bold\"/,/stylevalue/{s/MiLanProVF/Roboto-Medium/;/stylevalue/d}' $SYSXML
		sed -i '/\"miui-bold\"/,/stylevalue/{s/MiLanProVF/Roboto-Bold/;/stylevalue/d}' $SYSXML
		sed -i '/\"mipro\"/,/stylevalue/{s/MiLanProVF/Roboto-Regular/;/stylevalue/d}' $SYSXML
		sed -i '/\"mipro\"/,/stylevalue/{s/MiLanProVF/Roboto-Bold/;/stylevalue/d}' $SYSXML
		sed -i '/\"mipro-thin\"/,/stylevalue/{s/MiLanProVF/Roboto-Thin/;/stylevalue/d}' $SYSXML
		sed -i '/\"mipro-thin\"/,/stylevalue/{s/MiLanProVF/Roboto-Light/;/stylevalue/d}' $SYSXML
		sed -i '/\"mipro-extralight\"/,/stylevalue/{s/MiLanProVF/Roboto-Thin/;/stylevalue/d}' $SYSXML
		sed -i '/\"mipro-extralight\"/,/stylevalue/{s/MiLanProVF/Roboto-Light/;/stylevalue/d}' $SYSXML
		sed -i '/\"mipro-light\"/,/stylevalue/{s/MiLanProVF/Roboto-Light/;/stylevalue/d}' $SYSXML
		sed -i '/\"mipro-light\"/,/stylevalue/{s/MiLanProVF/Roboto-Regular/;/stylevalue/d}' $SYSXML
		sed -i '/\"mipro-normal\"/,/stylevalue/{s/MiLanProVF/Roboto-Light/;/stylevalue/d}' $SYSXML
		sed -i '/\"mipro-normal\"/,/stylevalue/{s/MiLanProVF/Roboto-Regular/;/stylevalue/d}' $SYSXML
		sed -i '/\"mipro-regular\"/,/stylevalue/{s/MiLanProVF/Roboto-Regular/;/stylevalue/d}' $SYSXML
		sed -i '/\"mipro-regular\"/,/stylevalue/{s/MiLanProVF/Roboto-Medium/;/stylevalue/d}' $SYSXML
		sed -i '/\"mipro-medium\"/,/stylevalue/{s/MiLanProVF/Roboto-Medium/;/stylevalue/d}' $SYSXML
		sed -i '/\"mipro-medium\"/,/stylevalue/{s/MiLanProVF/Roboto-Bold/;/stylevalue/d}' $SYSXML
		sed -i '/\"mipro-demibold\"/,/stylevalue/{s/MiLanProVF/Roboto-Medium/;/stylevalue/d}' $SYSXML
		sed -i '/\"mipro-demibold\"/,/stylevalue/{s/MiLanProVF/Roboto-Bold/;/stylevalue/d}' $SYSXML
		sed -i '/\"mipro-semibold\"/,/stylevalue/{s/MiLanProVF/Roboto-Medium/;/stylevalue/d}' $SYSXML
		sed -i '/\"mipro-semibold\"/,/stylevalue/{s/MiLanProVF/Roboto-Bold/;/stylevalue/d}' $SYSXML
		sed -i '/\"mipro-bold\"/,/stylevalue/{s/MiLanProVF/Roboto-Bold/;/stylevalue/d}' $SYSXML
		sed -i '/\"mipro-bold\"/,/stylevalue/{s/MiLanProVF/Roboto-Black/;/stylevalue/d}' $SYSXML
		sed -i '/\"mipro-heavy\"/,/stylevalue/{s/MiLanProVF/Roboto-Black/;/stylevalue/d}' $SYSXML
	else
		rm $SYSXML
	fi
}

# samsung() {
# }

### SELECTIONS ###

WHERE=1
ui_print "   "
ui_print "- WHERE to Install?"
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

TXTHF=false
if [ $STYLE -eq 3 ]; then
	ui_print "   "
	ui_print "- Style Text for Headline?"
	ui_print "  Vol+ = Yes; Vol- = No/Only Body + Condensed"
	ui_print "   "
	if $VKSEL; then
		TXTHF=true	
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
ui_print "- Use Android Default Font Reference?"
ui_print "  Vol+ = Yes; Vol- = No/Not Sure"
ui_print "   "
if $VKSEL; then
	XML=true	
	ui_print "  Selected: Yes"
else
	ui_print "  Selected: No"	
fi

### INSTALLATION ###
ui_print "   "
ui_print "- Installing"

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

if $TNUM; then
	tnum; sed -ie 3's/$/-tnum&/' $MODPROP;
fi

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
