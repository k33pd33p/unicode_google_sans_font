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
hftext() { cp $FONTDIR/txt/hf/*ttf $SYSFONT; }
text() {
	cp $FONTDIR/txt/bf/*ttf $SYSFONT
	cp $FONTDIR/txt/cf/*ttf $SYSFONT
}
original() { cp $FONTDIR/ori/*ttf $SYSFONT; }
bolder() { cp $FONTDIR/bd/*ttf $SYSFONT; }
legible() {
	DEST=$FONTDIR/bf/hl
	if [ $STYLE -eq 2 ]; then
		DEST=$FONTDIR/alt/hl
	elif [ $STYLE -eq 4 ]; then
		DEST=$FONTDIR/ori/hl
	elif [ $STYLE -eq 5 ]; then
		DEST=$FONTDIR/bd/hl
	fi
	cp $DEST/*ttf $SYSFONT;
}
xml() { cp $FONTDIR/xml/fonts.xml $SYSXML; }
custom() { cp -rf $FONTDIR/system/* $MODPATH/system; }

cleanup() {
	rm -rf $FONTDIR
	rmdir -p $SYSETC $PRDFONT
}

pixel() {
	DEST=$PRDFONT
	if [ -f /system/fonts/GoogleSans-Regular.ttf ]; then
		DEST=$SYSFONT
	fi
	if [ $HFSTYLE -eq 2 ]; then
		cp $FONTDIR/txt/bf/Roboto-Regular.ttf $DEST/GoogleSans-Regular.ttf
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
		sed -i '/\"miui\"/,/family>/{/400/,/>/s/MiLanProVF/Roboto-Regular/;/700/,/>/s/MiLanProVF/Roboto-Bold/;/stylevalue/d}' $SYSXML
		sed -i '/\"miui-thin\"/,/family>/{/400/,/>/s/MiLanProVF/Roboto-Thin/;/700/,/>/s/MiLanProVF/Roboto-Light/;/stylevalue/d}' $SYSXML
		sed -i '/\"miui-light\"/,/family>/{/400/,/>/s/MiLanProVF/Roboto-Light/;/700/,/>/s/MiLanProVF/Roboto-Regular/;/stylevalue/d}' $SYSXML
		sed -i '/\"miui-regular\"/,/family>/{/400/,/>/s/MiLanProVF/Roboto-Regular/;/700/,/>/s/MiLanProVF/Roboto-Medium/;/stylevalue/d}' $SYSXML
		sed -i '/\"miui-bold\"/,/family>/{/400/,/>/s/MiLanProVF/Roboto-Medium/;/700/,/>/s/MiLanProVF/Roboto-Bold/;/stylevalue/d}' $SYSXML
		sed -i '/\"mipro\"/,/family>/{/400/,/>/s/MiLanProVF/Roboto-Regular/;/700/,/>/s/MiLanProVF/Roboto-Bold/;/stylevalue/d}' $SYSXML
		sed -i '/\"mipro-thin\"/,/family>/{/400/,/>/s/MiLanProVF/Roboto-Thin/;/700/,/>/s/MiLanProVF/Roboto-Light/;/stylevalue/d}' $SYSXML
		sed -i '/\"mipro-extralight\"/,/family>/{/400/,/>/s/MiLanProVF/Roboto-Thin/;/700/,/>/s/MiLanProVF/Roboto-Light/;/stylevalue/d}' $SYSXML
		sed -i '/\"mipro-light\"/,/family>/{/400/,/>/s/MiLanProVF/Roboto-Light/;/700/,/>/s/MiLanProVF/Roboto-Regular/;/stylevalue/d}' $SYSXML
		sed -i '/\"mipro-normal\"/,/family>/{/400/,/>/s/MiLanProVF/Roboto-Light/;/700/,/>/s/MiLanProVF/Roboto-Regular/;/stylevalue/d}' $SYSXML
		sed -i '/\"mipro-regular\"/,/family>/{/400/,/>/s/MiLanProVF/Roboto-Regular/;/700/,/>/s/MiLanProVF/Roboto-Medium/;/stylevalue/d}' $SYSXML
		sed -i '/\"mipro-medium\"/,/family>/{/400/,/>/s/MiLanProVF/Roboto-Medium/;/700/,/>/s/MiLanProVF/Roboto-Bold/;/stylevalue/d}' $SYSXML
		sed -i '/\"mipro-demibold\"/,/family>/{/400/,/>/s/MiLanProVF/Roboto-Medium/;/700/,/>/s/MiLanProVF/Roboto-Bold/;/stylevalue/d}' $SYSXML
		sed -i '/\"mipro-semibold\"/,/family>/{/400/,/>/s/MiLanProVF/Roboto-Medium/;/700/,/>/s/MiLanProVF/Roboto-Bold/;/stylevalue/d}' $SYSXML
		sed -i '/\"mipro-bold\"/,/family>/{/400/,/>/s/MiLanProVF/Roboto-Bold/;/700/,/>/s/MiLanProVF/Roboto-Black/;/stylevalue/d}' $SYSXML
		sed -i '/\"mipro-heavy\"/,/family>/{/400/,/>/s/MiLanProVF/Roboto-Black/;/stylevalue/d}' $SYSXML
	else
		rm $SYSXML
	fi
}

### SELECTIONS ###

PART=1
ui_print "   "
ui_print "  ====================================================="
ui_print "  Font can be installed only for headline (bold text)  "
ui_print "  or body (regular text) or full (system wide).        "
ui_print "  ====================================================="
ui_print "   "
ui_print "- What do you want install this font for?"
ui_print "  Vol+ = Select; Vol- = Ok"
ui_print "   "
ui_print "  1. Full"
ui_print "  2. Headline"
ui_print "  3. Headline/Body"
ui_print "   "
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
ui_print "   "
ui_print "  Selected: $PART"

ui_print "   "
ui_print "  ====================================================="
ui_print "  Choose your favorite font styles. You don't really   "
ui_print "  need to know the differences between these styles.   "
ui_print "  Try each one until you find the most comfortable.    "
ui_print "  ====================================================="
HFSTYLE=1
ui_print "   "
ui_print "- Which headline font style do you like?"
ui_print "  Vol+ = Select; Vol- = OK"
ui_print "   "
ui_print "  1. Default"
ui_print "  2. Text"
ui_print "   "
ui_print "  Select:"
while true; do
	ui_print "  $HFSTYLE"
	if $VKSEL; then
		HFSTYLE=$((HFSTYLE + 1))
	else 
		break
	fi
	if [ $HFSTYLE -gt 2 ]; then
		HFSTYLE=1
	fi
done
ui_print "   "
ui_print "  Selected: $HFSTYLE"

STYLE=0
if [ $PART -ne 2 ]; then
	STYLE=1
	ui_print "   "
	ui_print "- Which body font style do you like?"
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

HL=false
if [ $PART -ne 2 ]; then
	if [ $STYLE -ne 3 ]; then
		ui_print "   "
		ui_print "- Enable high legibility feature for body text?"
		ui_print "  Vol+ = Yes; Vol- = No"
		ui_print "   "
		if $VKSEL; then
			HL=true	
			ui_print "  Selected: Yes"
		else
			ui_print "  Selected: No"	
		fi
	fi
fi

ROM=1
ui_print "   "
ui_print "  ====================================================="
ui_print "  If your default system font is Roboto, choose 1. For "
ui_print "  OOS the SlateForOnePlus font will also be replaced.  "
ui_print "  Choose MIUI if MiLanPro is the default font. Pixel   "
ui_print "  is for ROMs that have Google Sans font.              "
ui_print "  ====================================================="
ui_print "   "
ui_print "- Which ROM/OS are you using?"
ui_print "  Vol+ = Select; Vol- = Ok"
ui_print "   "
ui_print "  1. AOSP/LOS"
ui_print "  2. Oxygen OS"
ui_print "  3. MIUI 11"
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
ui_print "  ====================================================="
ui_print "  This is the default fonts.xml file from Android Q.   "
ui_print "  If your system font isn't changed after reboot, try  "
ui_print "  enable this option might help.                       "
ui_print "  ====================================================="
ui_print "   "
ui_print "- Use Android default font reference?"
ui_print "  Vol+ = Yes; Vol- = No/Don't Know"
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

case $PART in
	1 ) full;;
	2 ) headline; sed -ie 3's/$/-hf&/' $MODPROP;;
	3 ) headline; body; sed -ie 3's/$/-hbf&/' $MODPROP;;
esac

case $HFSTYLE in
        2 ) hftext; sed -ie 3's/$/-htxt&/' $MODPROP;;
esac

case $STYLE in
	2 ) alternative; sed -ie 3's/$/-alt&/' $MODPROP;;
	3 ) text; sed -ie 3's/$/-txt&/' $MODPROP;;
	4 ) original; sed -ie 3's/$/-ori&/' $MODPROP;;
	5 ) bolder; sed -ie 3's/$/-bd&/' $MODPROP;;
esac


if $HL; then
	legible; sed -ie 3's/$/-hl&/' $MODPROP;
fi

case $ROM in
	2 ) oxygen; sed -ie 3's/$/-oos&/' $MODPROP;;
	3 ) miui; sed -ie 3's/$/-mi&/' $MODPROP;;
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
ui_print "  ====================================================="
ui_print "  The installation is completed. If you want to change "
ui_print "  your previous settings just reflash the zip. Reboot  "
ui_print "  to see changes.                                      "
ui_print "  ====================================================="
ui_print "   "
ui_print "- Cleaning up"
cleanup

ui_print "   "
