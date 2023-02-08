#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess --no-align --tuples-on -c"

echo "Enter your username:"
read USERNAME

USER=$($PSQL "select name from users where name='$USERNAME'")
GAMES=$($PSQL "SELECT COUNT(*) FROM users JOIN games USING(user_id) WHERE name='$USERNAME'")
BEST_GAME=$($PSQL "SELECT MIN(number_guesses) FROM users JOIN games USING(user_id) WHERE name='$USERNAME'")
if [[ -z $USER ]]
then
  ADD_USERNAME=$($PSQL "INSERT INTO users(name) VALUES('$USERNAME')")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
 echo "Welcome back, $USERNAME! You have played $GAMES games, and your best game took $BEST_GAME guesses."
fi

NUMBER=$((1 + $RANDOM % 1000))
echo $NUMBER
GUESS=1
echo "Guess the secret number between 1 and 1000:"

while read USER_NUMBER
do
  if [[ ! $USER_NUMBER =~ ^[0-9]+$ ]]  
    then
      echo "That is not an integer, guess again:"
    else
      if [[ $USER_NUMBER -eq $NUMBER ]]
        then
          echo "You guessed it in $GUESS tries. The secret number was $USER_NUMBER. Nice job!"
          break;
        else
          if [[ $USER_NUMBER -gt $NUMBER ]]
          then
            echo -n "It's lower than that, guess again:"
          elif [[ $USER_NUMBER -lt $NUMBER ]]
           then
            echo -n "It's higher than that, guess again:"
        fi
    fi
  fi      
  GUESS=$(( $GUESS + 1 ))
done

USER_ID=$($PSQL "SELECT user_id FROM users where name='$USERNAME'")
INSERT_GAMES=$($PSQL "INSERT INTO games(number_guesses, user_id) VALUES($GUESS, $USER_ID)")
