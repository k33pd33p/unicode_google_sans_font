NOK=true
SEL=1

hf () { cp -r $INSTALLER/custom/HF/* $INSTALLER/system/; }
bf () { cp -r $INSTALLER/custom/BF/* $INSTALLER/system/; }
cf () { cp -r $INSTALLER/custom/CF/* $INSTALLER/system/; }
full () { headline; body; condensed; }
alt () { cp -r $INSTALLER/custom/Alt/* $INSTALLER/system/; }

echo "
Which version do you want to install?
Vol+ = Select; Vol- = Ok

1. Full
2. Full + Alternative
3. Headline
4. Headline/Body
5. Headline/Body + Alternative
"
echo 'Answer:'
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

echo -e "\nYou selected $SEL.\n"
case $SEL in
	1 ) full;;
	2 ) full; alt;;
	3 ) hf;;
	4 ) hf; bf;;
	5 ) hf; bf; alt;;
esac

echo ""
