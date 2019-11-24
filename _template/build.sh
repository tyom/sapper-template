#!/bin/bash
cd "$(dirname "$0")"

if [ "$CI" ]; then
	(umask 0077; echo "$SSH_KEY" > ~/ssh_key)
	git config user.email 'noreply@tyom.dev'
	git config user.name '[bot]'
fi

# branch names
ROLLUP=rollup
WEBPACK=webpack

./create-branches.sh $ROLLUP $WEBPACK

# force push rollup and webpack branches and repos
GIT_SSH_COMMAND='ssh -o StrictHostKeyChecking=accept-new -i ~/ssh_key' git push git@github.com:tyom/sapper-template.git $ROLLUP $WEBPACK -f
