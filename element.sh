if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"
  if [[ "$1" =~ ^[0-9]+$ ]]
  then
    DATA=$($PSQL "SELECT * FROM properties NATURAL JOIN elements NATURAL JOIN types WHERE atomic_number=$1")
  else
    DATA=$($PSQL "SELECT * FROM properties NATURAL JOIN elements NATURAL join types WHERE symbol='$1' OR name='$1'")
  fi
  if [[ -z $DATA ]]
  then
    echo 'I could not find that element in the database.'
  else
    echo "$DATA" | while read TYPE_ID BAR ATOMIC_NUM BAR ATOMIC_MASS BAR MELTING_P BAR BOILING_P BAR SYMBOL BAR NAME BAR TYPE
    do
      # This will be executed only once!
      echo "The element with atomic number $ATOMIC_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_P celsius and a boiling point of $BOILING_P celsius."
    done
  fi
fi