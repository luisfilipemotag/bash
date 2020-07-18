
#!/bin/bash
PS3='Please enter your choice: '
options=("Register" "Login" "End Work" )
select opt in "${options[@]}"
do
    case $opt in
        "Register")
            echo "Login Name ?"
	    read login
Ans_U="$(grep -w -c  $login account.txt)"

 if [ "$Ans_U" -ne 1 ]; then 

echo "Password ?"
read pass 
echo "$login $pass" >> account.txt 
echo "Registed !!!"




else echo "already exist that name !! " ;
fi

            ;;

        "Login")

	   echo "Login Name ?"
            read login
	   echo "Password ?"
            read pass
        

           Ans_U="$(grep -w -c "$login"\."$pass" account.txt )"
              if [ "$Ans_U" -eq 1 ]; then 




			options=("First name Last name" "Phone no" "E-mail" "Exit")
			select opt in "${options[@]}"
		do
    			case $opt in
       		 "First name Last name")

		grep -Eo '^[A-Z][a-z]+[[:space:]][A-Z][a-z]+' name_grep.txt     
      		 ;;



       		 "Phone no")

			grep -E '\([0-9]{3}\)-[0-9]{3}-[0-9]{4}' name_grep.txt 
			grep -E '[0-9]{3}-[0-9]{3}-[0-9]{3}' name_grep.txt 





           	 ;;
       		 "E-mail")
 
			grep -E "[a-z0-9]+@[a-z]+\.[a-z]{3}" name_grep.txt
          


           	 ;;




        "Exit")
echo "press 3 to exit !!"
        
    break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done



else echo "Erro password or name wrong !! " ;
fi


            ;;
        "End Work")
 	
           break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
