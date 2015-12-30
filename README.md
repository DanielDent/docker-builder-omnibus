# docker-builder-omnibus - Polyglot CI Build Environment

This image currently contains:
   * Debian build-essential
   * wget
   * curl
   * git
   * Erlang, Elixir, mix, hex, rebar
   * Python + pip
   * Node
   * inotify-tools
   * a Postgres client
   * docker-engine + docker-compose.
   * nano
   * jed
   * mtr-tiny
   * jed
   * lsof
   * rsync
   * rdate
   * dnsutils
   * dstat
   * ifstat
   * bwm-ng
   * mosh
   * telnet
   * sysstat
   * PHP 5 CLI, Composer, PHP FPM, PHP Pear, PHP CodeSniffer, various PHP packages, and IonCube Loader
   * SaltStack
   
It can be used as a build environment by a CI system, or to quickly bring up an environment during development work.

By using a privileged container and bind mounting /var/run/docker.sock, it can be used to build Dockerfiles. Educate
yourself on the security implications of this arrangement before using it.

Unlike many Docker images, apt package lists are left in the image to enable quick installation of additional packages.
