#!/bin/bash

BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default values for environment variables
CAT="production"
OXYGEN="production"

# Flags to track if each option is set
cat_local_flag=false
oxygen_local_flag=false

# Parse command line options
while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        -o|--oxygen)
        oxygen_local_flag=true
        ;;
        -c|--cat)
        cat_local_flag=true
        ;;
        *)
        # unknown option
        ;;
    esac
    shift # past argument or value
done

# Set the environment variables based on flags
if [ "$cat_local_flag" = true ]; then
    CAT="local"
fi

if [ "$oxygen_local_flag" = true ]; then
    OXYGEN="local"
fi

# Change directory to the emerging-artists-chicago project directory
echo "Changing directory to ~/typenex-medical-gatsby..."
cd ~/typenex-medical-gatsby

# Setting the environment variable for the project
export CAT_DATA_LEVEL=staging
echo -e "CAT_DATA_LEVEL is set to ${BLUE}$CAT_DATA_LEVEL${NC}"
export HIERARCHY_LEVEL=development
echo -e "HIERARCHY_LEVEL is set to ${BLUE}$HIERARCHY_LEVEL${NC}"
export GATSBY_ALGOLIA_INDEX=development
echo -e "GATSBY_ALGOLIA_INDEX is set to ${BLUE}$GATSBY_ALGOLIA_INDEX${NC}"
export CAT="$CAT"
echo -e "CAT is set to ${BLUE}$CAT${NC}"
export OXYGEN="$OXYGEN"
echo -e "OXYGEN is set to ${BLUE}$OXYGEN${NC}"
echo "Run with --cat or -c to set CAT to local or --oxygen or -o to set OXYGEN to local."

# Start the local server
echo -e "Running 'gatsby clean' and 'gatsby develop' in the typenex-medical-gatsby project directory...\n"
gatsby clean
gatsby develop

# Print message indicating the script has finished
echo "Run server process has finished."
