# codespace-hosted-runner

Need to test something using a self-hosted runner real quick? That's what this repo is all about!

This repo uses GitHub CLI extension [gh-runner](https://github.com/dedac/gh-runner) to create a self hosted runner in your codespace

There are 2 Codespaces Secrets you need to set:
* RUNNER_TOKEN: Personal Access Token used for creating runner (Required)
* EXTRA_ARGS: Additional arguments you want to pass to GitHub CLI (Optional)

If you've got an existing codespace that you want to turn into a runner:
* Set the Codespaces Secrets above as environment variables
* Run [.devcontainer/postCreateContainer.sh](.devcontainer/postCreateContainer.sh)
