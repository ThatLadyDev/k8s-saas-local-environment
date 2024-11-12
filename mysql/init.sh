#!/bin/bash

# Substitute environment variables into the user-creation.sql
echo "Creating user..."

# Use envsubst to replace environment variables in user-creation.sql
envsubst < /docker-entrypoint-initdb.d/user-creation.sql > /docker-entrypoint-initdb.d/actual_user_creation.sql

# Run the user creation SQL file
mysql -u root -p"$MYSQL_ROOT_PASSWORD" < /docker-entrypoint-initdb.d/actual_user_creation.sql

echo "User creation complete."

# Now, create the database and grant access to the user
echo "Creating database and granting user access..."

# Substitute environment variables into db-creation.sql
envsubst < /docker-entrypoint-initdb.d/db-creation.sql > /docker-entrypoint-initdb.d/actual_db_creation.sql

# Run the db creation and permission assignment SQL file
mysql -u root -p"$MYSQL_ROOT_PASSWORD" < /docker-entrypoint-initdb.d/actual_db_creation.sql

echo "Database and access setup complete!"