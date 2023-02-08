#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess --no-align --tuples-on -c"

echo "Enter your username:"
read USER

USERNAME=$($PSQL "select name from users where name='$USER'")

if [[ -z $USERNAME ]]
then
  ADD_USERNAME=$($PSQL "INSERT INTO users(name) VALUES($USERNAME)")
else
  echo "Welcome back, $USERNAME! You have played <games_played> games, and your best game took <best_game> guesses."