#!/bin/bash

# Use the -t argument to print only tuples
PSQL="psql -X --username=freecodecamp --dbname=salon -t -c"

echo "~~~~~ MY SALON ~~~~~"

# Perform a query, asking the id and name of each service
SERVICES_INFO=$($PSQL "SELECT * FROM Services")

# Print the menu, based on the results of the above query
SHOW_MENU(){
  
  if [[ ! -z $1 ]]
  then
    echo -e "$1"
  fi
  
  echo "$SERVICES_INFO"  | while read SERVICE_ID BAR NAME
  do
    echo -e "$SERVICE_ID) $NAME"
  done

}

ASK_SERVICE_ID(){

  SHOW_MENU "$1"

  read SERVICE_ID_SELECTED
  SERVICE_NAME=$($PSQL "SELECT name FROM Services WHERE service_id=$SERVICE_ID_SELECTED" | sed -E 's/^ *| *$//g')
  
  if [[ -z $SERVICE_NAME ]]
  then
    ASK_SERVICE_ID "\nPlease enter a valid service id. Try again:\n"
  else
    CORE "$SERVICE_ID_SELECTED" "$SERVICE_NAME"
  fi

}

CORE(){
  echo -e "\nPlease provide your phone number:"
  read CUSTOMER_PHONE

  SELECT_RES=$($PSQL "SELECT customer_id, name FROM Customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $SELECT_RES ]]
  then
    echo -e "\nPlease provide your name:"
    read CUSTOMER_NAME
    $PSQL "INSERT INTO Customers(name, phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')"
  fi

  echo -e "\nPlease enter service time:"
  read SERVICE_TIME

  SERVICE_ID=$1
  SERVICE_NAME=$2
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM Customers WHERE phone='$CUSTOMER_PHONE'")

  $PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID, '$SERVICE_TIME')"
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME.\n"

}

# Are there any services?
if [[ -z $SERVICES_INFO ]]
then
  # If no, print an error message.
  echo "Unfortunately, we could not find any service available. Please retry later."
else
  ASK_SERVICE_ID "\nWelcome to My Salon, how can I help you?\n"
fi