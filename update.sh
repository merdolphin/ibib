#/bin/bash

## update to the github
## written by lina on 31/10/2012

git checkout

git commit -am "new modification"

git push origin master < authorize.file


scp -p biophymd.bib biophyabbrev.bib biodrug.bib  bii:/home/zhaol/Private
