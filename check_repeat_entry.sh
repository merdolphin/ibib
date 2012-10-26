#!/bin/bash

## written by lina on 26/10/2012

more biophymd.bib | grep pages | sort | awk '{print $3}' | sed 's/"//g' | sort | uniq -c | sort
