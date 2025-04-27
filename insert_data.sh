#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE TABLE games, teams")

get_team_id(){
  team_id=$($PSQL "SELECT team_id FROM teams WHERE name='$1'")
  if [[ -z $team_id ]]
  then
    $PSQL "INSERT INTO teams(name) VALUES ('$1')" > /dev/null
    echo $(get_team_id "$1")
  else
    echo $team_id
  fi
}

cat games.csv | while IFS="," read year round winner opponent winner_goals opponent_goals
do
  # Ignore the first row (that containes the column names)
  if [[ $year != year ]]
  then
    
    WINNER_ID=$(get_team_id "$winner")
    OPPONENT_ID=$(get_team_id "$opponent")

    $PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($year, '$round', $WINNER_ID, $OPPONENT_ID, $winner_goals, $opponent_goals)" > /dev/null

  fi
done