#!/bin/bash
# Combines commits
#
# If the script fails, use the following commands to reset any changes.
# git cherry-pick --abort
# git reset --hard && git checkout master && git branch -D work

MESSAGE="Your message here"
SQUASH_START="123451111"
COMMIT_AFTER_SQUASH="123452222"

SQUASH_END=`git log --pretty=format:%P $COMMIT_AFTER_SQUASH | sed -n 1p`
COMMIT_BEFORE_SQUASH=`git log --pretty=format:%P $SQUASH_START | sed -n 1p`
LAST_COMMIT=`git log -n 1 master --pretty=format:%H`

echo "Squashing $SQUASH_START..$SQUASH_END"
echo "Most Recent Commit is $LAST_COMMIT"

set -e

read -r -p "Is this correct? [y/N] " response
case $response in
  [yY][eE][sS]|[yY])
    echo

    echo
    echo "----------------------------------------"
    echo "Checking out $SQUASH_END as a new branch"
    echo
    git checkout -b work $SQUASH_END

    echo
    echo "----------------------------------------"
    echo "Removing commits between $SQUASH_START..$SQUASH_END"
    echo
    git reset $COMMIT_BEFORE_SQUASH
    
    echo
    echo "----------------------------------------"
    echo "Creating new commit in place of removed commits"
    echo
    git commit -am "$MESSAGE"

    echo
    echo "----------------------------------------"
    echo "Adding all commits from the new commit to the end of master"
    echo
    git cherry-pick $COMMIT_AFTER_SQUASH^..$LAST_COMMIT

    echo
    echo "----------------------------------------"
    echo "Saving work to master"
    echo
    git checkout master
    git reset work
    git branch -d work
    ;;
  *)
    exit
    ;;
esac
