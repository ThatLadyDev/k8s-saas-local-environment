-- Create the user (if it doesn't exist)
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';

-- Grant the necessary privileges on the databases
GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%';

-- Apply the changes
FLUSH PRIVILEGES;