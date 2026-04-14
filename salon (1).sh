#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -t -A -c"

echo "~~~~~ MY SALON ~~~~~"
echo ""
echo "Welcome to My Salon, how can I help you?"

SERVICE_ID_SELECTED=""
while [[ -z "$SERVICE_ID_SELECTED" ]]; do
  # Display services
  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  echo "$SERVICES" | while IFS='|' read service_id name
  do
    # Skip empty lines
    [[ -z "$service_id" ]] && continue
    echo "$service_id) $name"
  done
  
  # Read service selection
  read SERVICE_ID_SELECTED
  
  # Check if the service exists
  SERVICE_EXISTS=$($PSQL "SELECT COUNT(*) FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  SERVICE_EXISTS=$(echo $SERVICE_EXISTS | xargs)  # trim whitespace
  
  if [[ $SERVICE_EXISTS -eq 0 ]]; then
    echo ""
    echo "I could not find that service. What would you like today?"
    SERVICE_ID_SELECTED=""
  fi
done

echo ""
echo "What's your phone number?"
read CUSTOMER_PHONE

# Check if customer exists
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
CUSTOMER_ID=$(echo $CUSTOMER_ID | xargs)  # trim whitespace

if [[ -z "$CUSTOMER_ID" ]]; then
  # Customer doesn't exist, ask for name and create
  echo ""
  echo "I don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME
  
  # Insert customer
  $PSQL "INSERT INTO customers (name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')" > /dev/null
  
  # Get the newly created customer_id
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  CUSTOMER_ID=$(echo $CUSTOMER_ID | xargs)  # trim whitespace
else
  # Customer exists, get their name
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id = $CUSTOMER_ID")
  CUSTOMER_NAME=$(echo $CUSTOMER_NAME | xargs)  # trim whitespace
fi

# Get service name
SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
SERVICE_NAME=$(echo $SERVICE_NAME | xargs)  # trim whitespace

echo ""
echo "What time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
read SERVICE_TIME

# Insert appointment
$PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')" > /dev/null

# Output confirmation
echo ""
echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
