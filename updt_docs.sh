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
if ! hugo; then
    echo -e "\n${RED}Hugo build failed${NC}"
    exit 1
fi

# Sync the site to the server
echo -e "${GREEN}Updating the documentation site...${NC}"
if ! rsync -rvz public/* draxpi:/opt/docker/land/data/html; then
    echo -e "${RED}Rsync failed${NC}"
    exit 1
else
    rm -rf public
fi

echo -e "\n${GREEN}Site updated successfully${NC}\n"

# EOF
