#!/usr/bin/env bash
#############################################################
#
# Author:       Samuel BOISTEL
# Topic:        Topic
# Date:         DATE
#
#############################################################

# Build the site
hugo build

if [ $? -eq 1 ]; then
    echo "Hugo build failed"
    exit 1
fi

# Sync the site to the server
rsync -rvz public/* draxpi:/opt/docker/land/data/html

[[ $? -eq 1 ]] && echo "Rsync failed" && exit 1 || rm -rf public

echo "Site updated successfully"

# EOF
