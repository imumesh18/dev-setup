.PHONY: all
all: atom bazel desktop docker gitkraken golang java keybase sublime-text tmux vagrant vbox vscode ## Installs all the programs inside this repository in single go.

.PHONY: atom
atom: ## Installs the atom text editor.
	@./atom.sh


.PHONY: base
base: ## Installs the basic packages for dev-setup.
	@./base.sh

.PHONY: bazel
bazel: ## Installs the bazel build.
	@./bazel.sh

.PHONY: desktop
desktop: ## Installs the visual studio text editor.
	@./desktop.sh

.PHONY: docker
docker: ## Installs the docker-ce.
	@./docker.sh

.PHONY: gitkraken
gitkraken: ## Installs the gitkraken.
	@./gitkraken.sh

.PHONY: golang
golang: ## Installs the golang.
	@./golang.sh

.PHONY: java
java: ## Installs the java.
	@./java.sh

.PHONY: keybase
keybase: ## Installs the keybase.
	@./keybase.sh

.PHONY: sublime-text
sublime-text: ## Installs the sublime text.
	@./sublime-text.sh

.PHONY: tmux
tmux: ## Installs the tmux.
	@./tmux.sh

.PHONY: vagrant
vagrant: ## Installs the vagrant.
	@./vagrant.sh

.PHONY: vbox
vbox: ## Installs the virtual box.
	@./vbox.sh

.PHONY: vscode
vscode: ## Installs the visual studio text editor.
	@./vscode.sh

PHONY: test
test: shellcheck## Runs all the tests on all the installation scripts in the repository.

PHONY: format
format: ## Formats all the script according to google guidelines.
	@shfmt -i 2 -ci -l *.sh

.PHONY: shellcheck
shellcheck: # Runs the shellcheck tests on the scripts.
	docker run --rm -it \
		--name df-shellcheck \
		-v $(CURDIR):/usr/src:ro \
		--workdir /usr/src \
		r.j3ss.co/shellcheck ./test.sh   

.PHONY: help
help: ## Shows help.
	@echo
	@echo 'Usage:'
	@echo '    make <target>'
	@echo
	@echo 'Targets:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "    \033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo
