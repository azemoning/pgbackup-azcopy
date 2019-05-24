#!/bin/bash

## PING HEALTHCHECKS BEFORE DELETING OLD BACKUP FILES
curl -fsS --retry 3 https://hc-ping.com/6ca8dfa3-b052-476e-b594-d549521a79e4 > /dev/null

## START DELETING OLD BACKUP FILES
find . -name "*.old" -type f -delete