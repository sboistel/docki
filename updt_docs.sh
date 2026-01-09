#!/usr/bin/env bash
#############################################################
#
# Author:       Samuel BOISTEL
# Topic:        Update the documentation site
#
#############################################################

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Build the site
echo -e "\n${GREEN}Building the documentation site...${NC}"
hugo build

if [ $? -eq 1 ]; then
    echo -e "\n${RED}Hugo build failed${NC}"
    exit 1
fi

# Sync the site to the server
echo -e "${GREEN}Updating the documentation site...${NC}"
rsync -rvz public/* draxpi:/opt/docker/land/data/html

[[ $? -eq 1 ]] && echo -e "${RED}Rsync failed${NC}" && exit 1 || rm -rf public

echo -e "\n${GREEN}Site updated successfully${NC}\n"

# EOF
