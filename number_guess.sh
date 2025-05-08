#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess -t -c"
RANDOM_NUM=$((($RANDOM+1)%1001))

echo $RANDOM_NUM

echo -e "Enter your username:"
read USERNAME

RES=$($PSQL "SELECT * FROM user_info WHERE user_name='$USERNAME'")

GET_GUESS_UNTIL_IS_RIGHT(){
  GUESSES=0
  echo "Guess the secret number between 1 and 1000:"
  read GUESS
  while [[ $GUESS -ne $RANDOM_NUM ]]
  do
    if [[ $GUESS =~ ^[0-9]+$ ]]
    then
      GUESSES=$(($GUESSES + 1))
      if [[ $GUESS -gt $RANDOM_NUM ]]
      then
        echo "It's lower than that, guess again:"
      else
        echo "It's higher than that, guess again:"
      fi
    else
      echo "That is not an integer, guess again:"
    fi
    read GUESS
  done

  GUESSES=$(($GUESSES+1))
  echo "You guessed it in $GUESSES tries. The secret number was $RANDOM_NUM. Nice job!"
  return $GUESSES
}

if [[ -z $RES ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  GET_GUESS_UNTIL_IS_RIGHT
  GUESSES=$?
  $PSQL "INSERT INTO user_info(user_name, num_games, min_guess) VALUES('$USERNAME', 1, $GUESSES)" > /dev/null
else

  echo $RES > temp
  read T_USERNAME BAR NUM_GAMES BAR MIN_NUM_GUESSES < temp

  echo "Welcome back, $USERNAME! You have played $NUM_GAMES games, and your best game took $MIN_NUM_GUESSES guesses."

  GET_GUESS_UNTIL_IS_RIGHT
  GUESSES=$?

  NEW_NUM=$(($NUM_GAMES+1))
  
  $PSQL "UPDATE user_info SET num_games=$NEW_NUM WHERE user_name='$USERNAME'" > /dev/null
  
  if [[ $GUESSES -lt $MIN_NUM_GUESSES ]]
  then
    $PSQL "UPDATE user_info SET min_guess=$GUESSES WHERE user_name='$USERNAME'" > /dev/null
  fi

fi