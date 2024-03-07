#!/bin/bash

# Change directory to the typenex-pim project directory
echo "Changing directory to ~/typenex-pim..."
cd ~/typenex-pim

# Activate the virtual environment
echo "Attempting to activate the virtual environment..."
source env/Scripts/activate

if [ -n "$VIRTUAL_ENV" ]; then
    echo "You are in virtual environment: $VIRTUAL_ENV"
else
    echo "WARNING: You are not in a virtual environment."
fi

# Run npm start
echo -e "Running 'python manage.py runserver 0.0.0.0:9000' in the typenex-pim project directory...\n"
python manage.py runserver 0.0.0.0:9000

# Print message indicating the script has finished
echo "Run server process has finished."
