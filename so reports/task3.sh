#!/bin/bash
PS3='Please enter your choice: '
options=("Sort" "Uniq" "Diff" "Exit")
select opt in "${options[@]}"
do
    case $opt in
        "Sort")
            echo "name of file to sort ?"
	    read files
	    echo "name of the file to output ?"
	    read output 
	   echo "wich sort coumn ?"
	    read col
	   echo "digital -> write n ||  text -> write l "
	   read dort
	if [ "$dort" == "n" ]; then sort -$dort -k $col  $files > $output
else sort -k $col $files > $output 
fi
            ;;
        "Uniq")

	    echo "name of file to see ?"
            read files
            echo "name of the file to output ?"
            read output 
	   uniq -c $files > $output


            ;;
        "Diff")
            echo  " name of the first file to diff ?"
            read files1
            echo  " name of the second file to compare ?"
            read files2

            echo "name of the file to output ?"
            read output
		
	    diff $files1 $files2 > $output 
          


            ;;
        "Exit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
