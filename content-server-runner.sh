#!/bin/bash

# Change directory to the content-server project directory
echo "Changing directory to ~/content-server..."
cd ~/content-server

# Activate the virtual environment
echo "Attempting to activate the virtual environment..."
source env/Scripts/activate

if [ -n "$VIRTUAL_ENV" ]; then
    echo "You are in virtual environment: $VIRTUAL_ENV"
else
    echo "WARNING: You are not in a virtual environment."
fi

# Run npm start
echo -e "Running 'python manage.py runserver 0.0.0.0:8002' in the CAT project directory...\n"
python manage.py runserver 0.0.0.0:8002

# Print message indicating the script has finished
echo "Run server process has finished."
