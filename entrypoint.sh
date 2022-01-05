#!/bin/sh

set -eu

cp -r .git .tmp.git

git config --global user.email "gihub-actions"
git config --global user.name "github-actions@github.com"
git config core.eol lf
git config core.autoCRLF input
git config core.safeCRLF true

LS_FILES=`git ls-files --full-name`

git rm -r --cached . > /dev/null
git commit --amend --allow-empty --no-edit > /dev/null

set +eu
count=0
while read line
do
  git add "$line" > /dev/null
  ret=$?
  if [ "$ret" != "0" ]; then
    count=`expr $count + 1`
  fi
done << FILE
$LS_FILES
FILE

set -eu
echo error count: $count
rm -rf .git .tmp.lsfile
mv .tmp.git .git

exit $count