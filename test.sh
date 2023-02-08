NUMBER=$(( $RANDOM % 1000 ))

echo "Guess the secret number between 1 and 1000:"

while read NUMBER
do
  if [[ ! $NUMBER =~ ^[0-9]+$ ]]  
    then
      echo "That is not an integer, guess again:"
    else
      if [[ $NUMBER -eq $USER_NUMBER ]]
        then
          break;
        else
          if [[ $NUMBER -gt $USER_NUMBER ]]
          then
            echo -n "It's lower than that, guess again:"
          elif [[ $NUMBER -lt $USER_NUMBER ]]
          then
            echo -n "It's higher than that, guess again:"
        fi
    fi
  fi      
done