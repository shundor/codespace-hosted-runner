#!/bin/bash

gh ext install Dedac/gh-runner
set | grep GITHUB_TOKEN | head -n 1 | awk -F= '{print $2}' >original_token.txt
unset GITHUB_TOKEN
echo $RUNNER_TOKEN >runner_token.txt
gh auth login --with-token < runner_token.txt
export GITHUB_TOKEN=$RUNNER_TOKEN
echo "Creating runner"
gh runner create --name codespace-runner $EXTRA_ARGS >runner-creation.log
echo "Starting runner"
/bin/bash ./codespace-runner/run.sh >runner.log
# Clean up
echo "Initiate cleanup"
unset GITHUB_TOKEN
gh auth login --with-token < original_token.txt
rm original_token.txt
rm runner_token.txt
