#!/bin/bash

GREP=${1:-"crab"}

for i in `ls crab_projects_HLT/ | grep "${GREP}" `
do
    crab status -d crab_projects_HLT/${i}
done