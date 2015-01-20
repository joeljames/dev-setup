# dev-setup
Is a script to set up a MacBook or iMac for local development. It sets up Python, Ruby, Node environments.

# Mac
## Update System
Manually update the system, For that: Apple Icon > Software Update...

## Install Command Line tools
Before running the mac set up script. Please install the Xcode from App Store, and Command Line Tools for Xcode. These include compilers that will allow you to build things from source.

## Install zsh
[oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh).
``` bash
https://github.com/robbyrussell/oh-my-zsh
```

## Install Dev Tools
``` bash
  $ zsh < <(curl -s https://github.com/joeljames/dev-setup/blob/master/mac/mac)
```

## What Gets Installed
<ul>
<li> Homebrew (Package management tool) </li>

<li> Homecask</li>
<li> Google Crome (Browser)</li>
<li> tree (To view a tree structure of your project)</li>
<li> wget (Package to retrive file through HTTP, HTTPS, FTP, etc)</li>
<li> git (Version control)</li>
<li> python (Programing Language; versions 2.7.x and 3.x)</li>
<li> easy_install (Setup tool for python)</li>
<li> pip (Tool for installing python packages)</li>
<li> virtualenv (Tool that creates an isolated Python environment for each of your projects)</li>
<li> node</li>
<li> rails (A ruby framework)</li>
<li> foreman (Manage Procfile-based applications)</li>
<li> postgres (A relational database)</li>
<li> mongo (A non-relational database)</li>
<li> redis (A key value cache and store)</li>
<li> memcached (A key value cache and store)</li>
<li> elasticsearch (A serach index)</li>
<li> docker (Build container apps)</li>
<li> heroku-toolbelt (Tools to interect with Heroku API)</li>
<li> aptible-cli (Tool to interect with Aptible API)</li>
</ul>
