#!/bin/bash 



oldcolour=ffffff

### With the help of tools like gpick you have decided for an hexadecimal colour.
### Copy/paste this hexadecimal code in the next line replacing the colour.

### Icons have 1 part 
### Icon in white  colour

for name in $(ls scalable/apps);do 

	newcolour=$(hexdump -n 3 -v -e '3/1 "%02X" "\n"' /dev/urandom)
	echo $newcolour
	### Do not change the next lines
	### Now all the icons will change colour.
	### The command will do the following
	### Find all svg's in the folder scalable/places that are of type 'files' (no symlinks) and replace the oldcolour
	### with the newcolour but anything white (ffffff) will never change.
	### Many folders are empty and have been included for future additions

	#folder apps
	sed -i '/fill="#fffffe"/!s/fill="#'$oldcolour'"/fill="#'$newcolour'"/g' scalable/apps/$name
	sed -i '/fill:#fffffe/!s/fill:#'$oldcolour'/fill:#'$newcolour'/g' scalable/apps/$name
	sed -i '/fill:#fffffe/!s/stroke:#'$oldcolour'/stroke:#'$newcolour'/g' scalable/apps/$name
	sed -i '/fill:#fffffe/!s/stroke="#'$oldcolour'"/stroke="#'$newcolour'"/g' scalable/apps/$name

	# #folder categories
	# find scalable/categories -name "*.svg" -type f -exec sed -i '/fill="#fffffe"/!s/fill="#'$oldcolour'"/fill="#'$newcolour'"/g' {}  \;
	# find scalable/categories -name "*.svg" -type f -exec sed -i '/fill:#fffffe/!s/fill:#'$oldcolour'/fill:#'$newcolour'/g' {}  \;
	# find scalable/categories -name "*.svg" -type f -exec sed -i '/fill:#fffffe/!s/stroke:#'$oldcolour'/stroke:#'$newcolour'/g' {}  \;
	# find scalable/categories -name "*.svg" -type f -exec sed -i '/fill:#fffffe/!s/stroke="#'$oldcolour'"/stroke="#'$newcolour'"/g' {}  \;

done


### Auto update the iconcache
### Do a manual update with following code in a terminal if you get errors
### gtk-update-icon-cache -f iconthemefolder

#gtk-update-icon-cache -f ../$(basename `pwd`)

### Give your new icon theme a proper name.
### Gpick gives you the name of the colour. You can use that as a reference or not.
### Change the name of your new icon theme inside the file 'index.theme' as well.
### This is only mandatory for XFCE.

### Select the new theme with your theme manager
### Have fun creating new themes.