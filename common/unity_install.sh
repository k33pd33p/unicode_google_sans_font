headline_font() { cp -rf $TMPDIR/custom/hf/*ttf $TMPDIR/system/fonts; }
body_font() { cp -rf $TMPDIR/custom/bf/*ttf $TMPDIR/system/fonts; }
condensed_font() { cp -rf $TMPDIR/custom/cf/*ttf $TMPDIR/system/fonts; }
full_font() { headline_font; body_font; condensed_font; }
alternative_font() { cp -rf $TMPDIR/custom/alt/*ttf $TMPDIR/system/fonts; }
original_font() { cp -rf $TMPDIR/custom/orig/*ttf $TMPDIR/system/fonts; }
# font_xml() { cp -rf $TMPDIR/custom/xml/*xml $TMPDIR/system/etc; }
custom_font() { cp -rf $TMPDIR/custom/system/* $TMPDIR/system/; }

oxygen() {
	cp $TMPDIR/system/fonts/Roboto-Black.ttf $TMPDIR/system/fonts/SlateForOnePlus-Black.ttf;
	cp $TMPDIR/system/fonts/Roboto-Bold.ttf $TMPDIR/system/fonts/SlateForOnePlus-Bold.ttf;
	cp $TMPDIR/system/fonts/Roboto-Medium.ttf $TMPDIR/system/fonts/SlateForOnePlus-Medium.ttf;
	cp $TMPDIR/system/fonts/Roboto-Regular.ttf $TMPDIR/system/fonts/SlateForOnePlus-Regular.ttf;
	cp $TMPDIR/system/fonts/Roboto-Regular.ttf $TMPDIR/system/fonts/SlateForOnePlus-Book.ttf;
	cp $TMPDIR/system/fonts/Roboto-Light.ttf $TMPDIR/system/fonts/SlateForOnePlus-Light.ttf;
	cp $TMPDIR/system/fonts/Roboto-Thin.ttf $TMPDIR/system/fonts/SlateForOnePlus-Thin.ttf;
}

miui() {
	cp $TMPDIR/system/fonts/Roboto-Regular.ttf $TMPDIR/system/fonts/MiLanProVF.ttf;
}

### SELECTIONS ###

PART=1
ui_print "   "
ui_print "- Which PART of the system font do you want to replace?"
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

VER=1
if [ $PART -ne 2 ]; then
	ui_print "   "
	ui_print "- Which VERSION do you want to install?"
	ui_print "  Vol+ = Select; Vol- = OK"
	ui_print "   "
	ui_print "  1. Default"
	ui_print "  2. Alternative"
	ui_print "  3. Original"
	ui_print "   "
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
	ui_print "   "
	ui_print "  Selected: $VER"
fi

ROM=1
ui_print "   "
ui_print "- Which ROM are you using?"
ui_print "  Vol+ = Select; Vol- = Ok"
ui_print "   "
ui_print "  1. AOSP"
ui_print "  2. Oxygen OS"
ui_print "  3. MIUI 11"
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

# XML=false
# ui_print "   "
# ui_print "- Include fontxml?"
# ui_print "  Vol+ = Yes; Vol- = No/Not Sure"
# ui_print "   "
# if $VKSEL; then
	# XML=true	
	# ui_print "  Selected: Yes"
# else
	# ui_print "  Selected: No"	
# fi

### INSTALLATION ###
mkdir -p $TMPDIR/system/fonts $TMPDIR/system/etc

case $PART in
	1 ) full_font;;
	2 ) headline_font; sed -ie 3's/$/-hf&/' $TMPDIR/module.prop;;
	3 ) headline_font; body_font; sed -ie 3's/$/-hbf&/' $TMPDIR/module.prop;;
esac

case $VER in
	2 ) alternative_font; sed -ie 3's/$/-alt&/' $TMPDIR/module.prop;;
	3 ) original_font; sed -ie 3's/$/-ori&/' $TMPDIR/module.prop;;
esac

# if $XML; then
#	font_xml; sed -ie 3's/$/-xml&/' $TMPDIR/module.prop;
# fi

case $ROM in
	2 ) oxygen; sed -ie 3's/$/-oos&/' $TMPDIR/module.prop;;
	3 ) miui; sed -ie 3's/$/-mi&/' $TMPDIR/module.prop;;
esac

if [ -d $TMPDIR/custom/system ]; then
	ui_print "   "
	ui_print "- Copying custom files"
	custom_font; sed -ie 3's/$/-cust&/' $TMPDIR/module.prop
fi

ui_print "   "
