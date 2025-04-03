#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Generate random number between 1 and 1000
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
GUESSES=0

# Get username
echo "Enter your username:"
read USERNAME

# Check if user exists
USER_INFO=$($PSQL "SELECT games_played, best_game FROM users WHERE username='$USERNAME'")

if [[ -z $USER_INFO ]]
then
  # New user
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USER=$($PSQL "INSERT INTO users(username, games_played) VALUES('$USERNAME', 0)")
else
  # Existing user
  GAMES_PLAYED=$(echo $USER_INFO | cut -d'|' -f1)
  BEST_GAME=$(echo $USER_INFO | cut -d'|' -f2)
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo "Guess the secret number between 1 and 1000:"
while true
do
  read GUESS
  
  # Check if input is an integer
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    continue
  fi

  # Increment guess counter
  ((GUESSES++))
  
  # Check guess
  if [[ $GUESS -eq $SECRET_NUMBER ]]
  then
    break
  elif [[ $GUESS -gt $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  else
    echo "It's higher than that, guess again:"
  fi
done

# Update user statistics
GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME'")
NEW_GAMES_PLAYED=$(($GAMES_PLAYED + 1))

CURRENT_BEST=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'")
if [[ -z $CURRENT_BEST || $GUESSES -lt $CURRENT_BEST ]]
then
  UPDATE_STATS=$($PSQL "UPDATE users SET games_played=$NEW_GAMES_PLAYED, best_game=$GUESSES WHERE username='$USERNAME'")
else
  UPDATE_STATS=$($PSQL "UPDATE users SET games_played=$NEW_GAMES_PLAYED WHERE username='$USERNAME'")
fi

echo "You guessed it in $GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
