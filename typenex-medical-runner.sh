#!/bin/bash

BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default values for environment variables
CAT="production"
OXYGEN="production"
GATSBY_ALGOLIA_INDEX="development"
ALGOLIA_SKIP_INDEXING="true"

# Flags to track if each option is set
cat_local_flag=false
oxygen_local_flag=false
algolia_local_flag=false
build_flag=false

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
        --algolia)
        algolia_local_flag=true
        ;;
        --build)
        build_flag=true
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

if [ "$algolia_local_flag" = true ]; then
    GATSBY_ALGOLIA_INDEX="local"
    ALGOLIA_SKIP_INDEXING="false"
fi

# Change directory to the emerging-artists-chicago project directory
echo "Changing directory to ~/typenex-medical-gatsby..."
cd ~/typenex-medical-gatsby

# Setting the environment variable for the project
export CAT_DATA_LEVEL=staging
echo -e "CAT_DATA_LEVEL is set to ${BLUE}$CAT_DATA_LEVEL${NC}"
export HIERARCHY_LEVEL=development
echo -e "HIERARCHY_LEVEL is set to ${BLUE}$HIERARCHY_LEVEL${NC}"
export GATSBY_ALGOLIA_INDEX="$GATSBY_ALGOLIA_INDEX"
echo -e "GATSBY_ALGOLIA_INDEX is set to ${BLUE}$GATSBY_ALGOLIA_INDEX${NC}"
export ALGOLIA_SKIP_INDEXING="$ALGOLIA_SKIP_INDEXING"
echo -e "ALGOLIA_SKIP_INDEXING is set to ${BLUE}$ALGOLIA_SKIP_INDEXING${NC}"
export CAT="$CAT"
echo -e "CAT is set to ${BLUE}$CAT${NC}"
export OXYGEN="$OXYGEN"
echo -e "OXYGEN is set to ${BLUE}$OXYGEN${NC}"
echo "Run with --cat or -c to set CAT to local, --oxygen or -o to set OXYGEN to local, or --algolia to set GATSBY_ALGOLIA_INDEX to local and ALGOLIA_SKIP_INDEXING to false."

# Start the local server
gatsby clean
if [ "$build_flag" = true ]; then
    echo -e "RUNNING BUILD...\n"
    gatsby build
else
    echo -e "Running 'gatsby clean' and 'gatsby develop' in the typenex-medical-gatsby project directory...\n"
    gatsby develop
fi

# Print message indicating the script has finished
echo "Run server process has finished."
