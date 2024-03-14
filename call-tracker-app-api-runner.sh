#!/bin/bash

BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Change directory to the CallTrackerAppApi project directory
echo "Changing directory to ~/CallTrackerAppApi..."
cd ~/CallTrackerAppApi

# Setting the environment variable for the project
export CALL_TRACKER_RUN_TYPE="staging"
export WRITE_TO_ADMIN_DB="false"
export LOG_LEVEL="temporary"
export LOG_TO_FILE="false"
export LOG_COLORS="true"

echo -e "CALL_TRACKER_RUN_TYPE is set to ${BLUE}$CALL_TRACKER_RUN_TYPE${NC}"
echo -e "WRITE_TO_ADMIN_DB is set to ${BLUE}$WRITE_TO_ADMIN_DB${NC}"
echo -e "LOG_LEVEL is set to ${BLUE}$LOG_LEVEL${NC}"
echo -e "LOG_TO_FILE is set to ${BLUE}$LOG_TO_FILE${NC}"
echo -e "LOG_COLORS is set to ${BLUE}$LOG_COLORS${NC}"

# Start the local server
echo -e "Running 'node call-tracker-app-api.js'...\n"
node call-tracker-app-api.js

# Print message indicating the script has finished
echo "Run server process has finished."
