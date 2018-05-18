# Dev Setup

[![Build Status](https://travis-ci.org/dungeonmaster18/dev-setup.svg?branch=master)](https://travis-ci.org/dungeonmaster18/dev-setup)

### Introduction

It's a simple one command linux development setup. It uses bash script and makefile to automate the instllation.

### Supported Platforms

* Ubuntu 16.04 LTS(Tested)
* Ubuntu 17.10 LTS(Tested)
* Ubuntu 18.04 LTS(Tested)(Except for docker)
* It should also work on debian based other distros as well.

### Installation

Installation is pretty much easy. You just need to select which app you want to install and see the following for a perticular installation command.
> I would suggest always install the base script first for other scripts to work properly.
```
$ make help

Usage:
    make <target>

Targets:
    all                            Installs all the programs inside this repository in single go.
    atom                           Installs the atom text editor.
    base                           Installs the basic packages for dev-setup.
    bazel                          Installs the bazel build.
    desktop                        Installs the visual studio text editor.
    docker                         Installs the docker-ce.
    format                         Formats all the script according to google guidelines.
    gitkraken                      Installs the gitkraken.
    golang                         Installs the golang.
    help                           Shows help.
    java                           Installs the java.
    keybase                        Installs the keybase.
    sublime-text                   Installs the sublime text.
    test                           Runs all the tests on all the installation scripts in the repository.
    tmux                           Installs the tmux.
    vagrant                        Installs the vagrant.
    vbox                           Installs the virtual box.
    vscode                         Installs the visual studio text editor.
```

### Testing

* It uses [Shellcheck](https://github.com/koalaman/shellcheck) to test the scripts. It can be done in two ways
    * Using Docker<br>
    ``` make test ```
    * Using Shellcheck Binary<br>
    ``` ./test.sh ```

* Test the script by running on your machine and see if it gets installed correctly.

### Formatting

Though this step is not mandatory but I do encourage people to format their shell scripts. It uses [shfmt](https://github.com/mvdan/sh) to format the scripts. To format your script just run.<br>

```make format```

> It uses [Google's Style](https://google.github.io/styleguide/shell.xml) guide to format the script.


### Motivation

> TODO: Put the motivation in more sane words.

So the story behind this repo is quite amazing. So I being a lazy ass and a linux nerd(I experiment a lot with my machines) which most of the time(almost all time ) used to break something and when I try fixing that I end up make a complete mesh of my machine so I have to use the ultimate weapon of every developer that is clean install my machine. I know that sucks because you have to setup everything from scratch. So I kind of thought why don't I have something to automate all this bullshit donkey work by just running simple command. I evaluated few of the options like vagrant and docker but I kind of use docker to run almost evrything but then too I needed do few of the basic setup. Vagrant is vmbox underneath which makes it heavy as I don't have a ultimate beast machine yet. Also I have come across the Boxen but that is too much for setting up personal machine because it uses puppet which not too easy to setup, I don't wanted to go down the puppet rabbit hole.
So I thought let's go bash way.

### Contribution

I know, I am not perfect so please give your feedback in the form of creating issues and PR, if you find something wrong please do create an issue. Contributions are most welcomed. Please make sure you [test](#Testing) and validate before creating your pr. I will make sure to reply your PR within 12hrs.

### Contributers

A special thanks to Pranit Raje([@stanforever](https://github.com/StanForever)) for adding docker installation script.

### TODO

- [ ] Add support for other linux distributions.<br>
- [ ] Add format check in testing.

### License

This project is licensed under the MIT License License - see the [LICENSE](LICENSE.md) file for details