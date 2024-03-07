#!/bin/bash

BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default values for environment variables
CAT="production"
CAT_DATA_LEVEL="staging"

# Flags to track if each option is set
local_flag=false
production_flag=false

# Parse command line options
while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        -l|--local)
        local_flag=true
        ;;
        -p|--production)
        production_flag=true
        ;;
        *)
        # unknown option
        ;;
    esac
    shift # past argument or value
done

# Set the environment variables based on flags
if [ "$local_flag" = true ]; then
    CAT="local"
fi

if [ "$production_flag" = true ]; then
    CAT_DATA_LEVEL="production"
fi

# Change directory to the emerging-artists-chicago project directory
echo "Changing directory to ~/emerging-artists-chicago..."
cd ~/emerging-artists-chicago

# Setting the environment variable for the project
export CAT="$CAT"
export CAT_DATA_LEVEL="$CAT_DATA_LEVEL"
echo -e "CAT is set to ${BLUE}$CAT${NC}"
echo -e "CAT_DATA_LEVEL is set to ${BLUE}$CAT_DATA_LEVEL${NC}"
echo "Run with --local or -l to set CAT to local or --production or -p to set CAT_DATA_LEVEL to production."


# Start the local server
echo -e "Running 'gatsby develop' in the emergin-artists-chicago project directory...\n"
gatsby develop

# Print message indicating the script has finished
echo "Run server process has finished."
