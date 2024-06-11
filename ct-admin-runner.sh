#!/bin/bash

# Change directory to the CallTrackerAppAPI project directory
echo "Changing directory to ~/CallTrackerAdminAPI..."
cd ~/CallTrackerAdminAPI

# Activate the virtual environment
echo "Attempting to activate the virtual environment..."
source env/Scripts/activate

if [ -n "$VIRTUAL_ENV" ]; then
    echo "You are in virtual environment: $VIRTUAL_ENV"
else
    echo "\nWARNING: You are not in a virtual environment!\n"
fi

# Run npm start
echo -e "Running 'python manage.py runserver 0.0.0.0:8007' in the CallTrackerAdminAPI project directory...\n"
python manage.py runserver 0.0.0.0:8007

# Print message indicating the script has finished
echo "Run server process has finished."
