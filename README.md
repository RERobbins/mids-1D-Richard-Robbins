# mids-1D-Richard-Robbins
Richard Robbins !D Computing Basics Course Project

## The project environment.

I am running this project from my home directory `/home/rerobbins` on an Ubuntu 21.10 server virtual machine named `basics`.

Here is the structure of the first two levels of my home directory on that machine.

```
rerobbins@basics:~$ tree -L 2
.
├── darkhttpd
│   ├── COPYING
│   ├── darkhttpd
│   ├── darkhttpd.c
│   ├── devel
│   ├── Dockerfile
│   ├── Makefile
│   ├── README.md
│   └── TODO
├── MIDS-1D-Computing-Basics
│   ├── LICENSE
│   ├── MIDS-1D-Computing-Basics.md
│   ├── README.md
│   ├── website
│   └── website.tar
├── mids-1D-Richard-Robbins
│   ├── project.sh
│   └── README.md
└── website -> MIDS-1D-Computing-Basics/website

6 directories, 13 files
```

I invoke the http server with the command `./darkhttpd/darkhttp ~/website --port 12345 --daemon` from my home directory which starts `darkhttpd` as a background process listening to `port 12345` and the root of the pages served is the `website` directory of my home directory, which is really a link to the website tree created by unpacking the tar file located in the cloned copy of the `MIDS-1D-Computing-Basics` repository.  That directory is where the sample website resides.

## Project Tasks

+ This README.md file is responsive to the first task prompt.

+ The github repository for this project appears at `https://github.com/RERobbins/mids-1D-Richard-Robbins`.  My work is being done in branch `working`.

+ I have done a Pull request from the `main` branch but not yet merged it.

+ The static website served by `darkhttp` satisfies the Challenge.  On my local network, I access the site from any browser via `http://basics.itinker.net:12345`.  All of the images appear in the format required.

+ After I started the http server I was able to modify the files that appear by making changes to index.html.  Those changes became apparent without the need to restart the server. Web servers access the served pages at runtime so changes made to the served pages are reflected once they are made without the need to restart the server itself.

+ I use ps aux | grep httpd to identify the process id of the web server.  The `ps aux` command produces a list of running processes.  I pipe the results to `grep` to filter only those processes containing the string `httpd`.  The first line below shows that the pid for the server is `66852` and the second line is the ID for the `grep` process itself.

```
Last login: Thu Dec 30 21:15:55 2021 from 198.183.251.204
rerobbins@basics:~$ ps aux | grep httpd
rerobbi+   66852  0.0  0.0   2788  1688 ?        Ss   21:24   0:00 ./darkhttpd/darkhttpd /home/rerobbins/website --port 12345 --daemon
rerobbi+   68309  0.0  0.0   6548  2440 pts/0    S+   22:16   0:00 grep --color=auto httpd
rerobbins@basics:~$ 
```

+ The bash shell script `project.sh` which is included in this repository contains my solution to the challenge task.  It is intended to be placed in the root directory of the sample site and invoked from the command line as `./project.sh > index.html`  That script renames files that include non-ASCII characters in their names using the `iconv` command which is included in the Ubuntu distribution.  It then creates the requisite `index.html` file, relying, in part on `HERE-docs` and makes use of loops and conditions.


