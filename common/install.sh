hf () { cp -r $INSTALLER/custom/HF/* $INSTALLER/system/; }
bf () { cp -r $INSTALLER/custom/BF/* $INSTALLER/system/; }
cf () { cp -r $INSTALLER/custom/CF/* $INSTALLER/system/; }
full () { hf; bf; cf; }
alt () { cp -r $INSTALLER/custom/Alt/* $INSTALLER/system/; }
xml () { cp -r $INSTALLER/custom/fontxml/* $INSTALLER/system/; }

SEL=1
NOK=true
XML=false

echo "
Which version?
Vol+ = Select; Vol- = Ok

1. Full
2. Full + Alternative
3. Headline
4. Headline/Body
5. Headline/Body + Alternative
"
echo 'Select:'
while $NOK; do
	echo "$SEL"
	if $VKSEL; then
		SEL=$((SEL + 1))
	else 
		NOK=false
	fi
	if [ $SEL -gt 5 ]; then
		SEL=1
	fi
done

echo -e "\nSelected:\n$SEL\n"

echo 'Include fontxml?
Vol+ = Yes; Vol- = No
'
if $VKSEL; then
	XML = true	
	echo "Selected:\nYes"
else
	echo "Selected:\nNo"	
fi

case $SEL in
	1 ) full;;
	2 ) full; alt;;
	3 ) hf;;
	4 ) hf; bf;;
	5 ) hf; bf; alt;;
esac

if $XML; then
	xml
fi

echo ""
