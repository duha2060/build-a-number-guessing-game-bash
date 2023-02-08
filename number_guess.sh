#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess --no-align --tuples-on -c"

NUMBER=$(( $RANDOM % 1000 + 1 ))
echo "Enter your username:"
read USERNAME

USER=$($PSQL "select name from users where name='$USERNAME'")
echo $USER
if [[ -z $USER ]]
then
  ADD_USERNAME=$($PSQL "INSERT INTO users(name) VALUES('$USERNAME')")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  echo "Welcome back, $USERNAME! You have played <games_played> games, and your best game took <best_game> guesses."
fi

