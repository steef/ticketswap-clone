# ticketswap-clone

A simplified version of TicketSwap

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Installing Command Line Tools

Open your Terminal and run:

```
xcode-select --install
```

If you'll receive the following message, you can just skip this step and go to next step.

```
# command line tools are already installed, use "Software Update" to install updates
```

Otherwise, it will open a window asking you if you want to install some software. Accept and wait. If it fails, try again the command line above, sometimes the Apple servers are overloaded.

### Installing Homebrew

On Mac, you need to install [Homebrew](http://brew.sh/) which is a Package Manager.
It will be used as soon as we need to install some software.
To do so, open your Terminal and run:

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

This will ask for your confirmation (hit `Enter`) and your laptop session password.

If you already have Homebrew, it will tell you so, that's fine, go on.

Then install some useful software:

```
brew update
```

If you get a `/usr/local must be writable` error, just run this:

```
sudo chown -R $USER:admin /usr/local
brew update
```

Error message or not, proceed running the following in the terminal (you can copy / paste all the lines at once).

```
function install_or_upgrade { brew ls | grep $1 > /dev/null; if (($? == 0)); then brew upgrade $1; else brew install $1; fi }
install_or_upgrade "git"
install_or_upgrade "wget"
install_or_upgrade "imagemagick"
install_or_upgrade "jq"
install_or_upgrade "openssl"
```

### Installing Ruby (with [rbenv](https://github.com/sstephenson/rbenv))

First we need to clean up any previous Ruby installation you might have:

```
rvm implode && sudo rm -rf ~/.rvm
# If you got "zsh: command not found: rvm", carry on. It means `rvm` is not
# on your computer, that's what we want!

sudo rm -rf $HOME/.rbenv /usr/local/rbenv /opt/rbenv /usr/local/opt/rbenv
```

Now let's get [`rbenv`](https://github.com/rbenv/rbenv) and [`ruby-build`](https://github.com/rbenv/ruby-build) packages from Homebrew, they'll be useful.

```
brew uninstall --force rbenv ruby-build
```

Then quit **all your opened terminal windows** (Cmd + Q) and restart one. Then run:

```
brew install rbenv
```

Again, quit all your terminal windows and restart.


Now, you are ready to install the latest ruby version, and set it as the default version.

Run this command, it will **take a while (5-10 minutes)**

```
rbenv install 2.4.3
```

Once the ruby installation is done, run this command to tell the system
to use the 2.4.3 version by default.

```
rbenv global 2.4.3
```

Then **restart** your Terminal again (close it and reopen it).

```
ruby -v
```

You should see something starting with `ruby 2.4.3p`.

### Installing Rails

```
gem install rails -v 5.1.4
```

Restart your terminal (⌘ + Q) Then, check setup with:

```
rails --version
```

You should see something starting with rails 5.1.4.

### Installing Postgresql

Let's install Postgresql, an open-source robust and production-ready database.

```
brew install postgresql
brew services start postgresql
```

### Installing Yarn

Let's install Yarn, a fast and secure dependency management.

```
brew install yarn
```

### Setup Project

Clone git repository.

```
git clone https://github.com/Stefanode/ticketswap-clone.git
```

Install all dependencies.

```
bundle install
yarn install
```

Create db and migrate schema.

```
rails db:create
rails db:migrate
```

Now run the application.

```
rails s
```

Open your browser and go to the following address.

```
http://localhost:3000/
```

Create an account using one of the accounts from the dataset and start using the website 🎉
