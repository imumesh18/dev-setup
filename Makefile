.PHONY: all
all: atom bazel docker gitkraken golang java keybase sublime-text tmux vagrant vbox vscode ## Installs all the programs inside this repository.

.PHONY: atom
atom: ## Installs the atom text editor.
	./atom.sh

.PHONY: bazel
bazel: ## Installs the bazel build.
	./bazel.sh

.PHONY: docker
docker: ## Installs the docker-ce.
	./docker.sh

.PHONY: gitkraken
gitkraken: ## Installs the gitkraken.
	./gitkraken.sh

.PHONY: golang
golang: ## Installs the golang.
	./golang.sh

.PHONY: java
golang: ## Installs the java.
	./java.sh

.PHONY: keybase
keybase: ## Installs the keybase.
	./keybase.sh

.PHONY: sublime-text
sublime-text: ## Installs the sublime text.
	./sublime-text.sh

.PHONY: tmux
tmux: ## Installs the tmux.
	./tmux.sh

.PHONY: vagrant
vagrant: ## Installs the vagrant.
	./vagrant.sh

.PHONY: vbox
vbox: ## Installs the virtual box.
	./vbox.sh

.PHONY: vscode
vscode: ## Installs the visual studio text editor.
	./vscode.sh

PHONY: test
test: shellcheck ## Runs all the tests on all the installation scripts in the repository.

.PHONY: shellcheck
shellcheck: ## Runs the shellcheck tests on the scripts.
	docker run --rm -it \
	--name df-shellcheck \ 
	-v $(pwd):/usr/src:ro \
	--workdir /usr/src \
	r.j3ss.co/shellcheck ./test.sh