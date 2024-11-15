#!/bin/bash

# Substitute environment variables into the user-creation.sql
echo "Creating user..."

# Use envsubst to replace environment variables in user-creation.sql
envsubst < /scripts/user-creation.sql > /scripts/actual_user_creation.sql

# Run the user creation SQL file
mysql -u root -p"$MYSQL_ROOT_PASSWORD" < /scripts/actual_user_creation.sql

echo "User creation complete."

# Now, create the database and grant access to the user
echo "Creating database and granting user access..."

# Substitute environment variables into db-creation.sql
envsubst < /scripts/db-creation.sql > /scripts/actual_db_creation.sql

# Run the db creation and permission assignment SQL file
mysql -u root -p"$MYSQL_ROOT_PASSWORD" < /scripts/actual_db_creation.sql

echo "Database and access setup complete!"