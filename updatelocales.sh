#!/bin/bash
# Run this script to export translations from CrowdIn.
# Requires CROWDIN_API_KEY environment variable to be set.

# Get mod name from info.json and use as the CrowdIn project name
# https://stedolan.github.io/jq/
projname=`cat info.json|jq -r .name`

# Call CrowdIn API to build and export latest translations
curl -k "https://api.crowdin.com/api/project/$projname/export?key=$CROWDIN_API_KEY"

# Download and unzip all translations
curl -k -o locales.zip "https://api.crowdin.com/api/project/$projname/download/all.zip?key=$CROWDIN_API_KEY"
unzip locales.zip -d temp

# Move translations into place
mv temp/locale/cs-CZ/dectorio.ini locale/cs/dectorio.cfg
mv temp/locale/de-DE/dectorio.ini locale/de/dectorio.cfg
mv temp/locale/ko-KR/dectorio.ini locale/ko/dectorio.cfg
mv temp/locale/pl-PL/dectorio.ini locale/pl/dectorio.cfg
mv temp/locale/ru-RU/dectorio.ini locale/ru/dectorio.cfg
mv temp/locale/zh-CN/dectorio.ini locale/zh-CN/dectorio.cfg
mv temp/locale/zh-TW/dectorio.ini locale/zh-TW/dectorio.cfg

# Clean up
rm locales.zip
rm -rf temp

# Commit to repo
#git add locale/*
#git commit -m "Update localisations"
