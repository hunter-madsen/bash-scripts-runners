#!/bin/bash

BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Check for the 'pim' flag
if [ "$1" == "--pim" ]; then
  echo -e "Setting PIM_BACKEND to ${BLUE}local${NC}"
  export PIM_BACKEND="local"
else
    echo -e "Setting PIM_BACKEND to ${BLUE}production${NC}. Run with --pim to use a local PIM server."
  export PIM_BACKEND="production"
fi

# Print the value of the PIM_BACKEND environment variable
echo -e "PIM_BACKEND is set to ${BLUE}$PIM_BACKEND${NC}"

# Change directory to the oxygen project directory
echo "Changing directory to ~/Oxygen..."
cd ~/Oxygen

# Run npm start
echo -e "Running 'npm start' in the oxygen project directory...\n"
npm start

# Print message indicating the script has finished
echo "npm start process in the oxygen project has finished."
