# `discolix/static`

**DockerHub:** https://hub.docker.com/r/discolix/static

Statically compiled applications that do not require libc can use the `discolix/static` image.

### Image Content Overview

**Debian Packages**
* `ca-certificates`
* `tzdata`

**Other**
* A `/etc/passwd` entry for a root user
* A `/tmp` directory

# `discolix/base`

**DockerHub:** https://hub.docker.com/r/discolix/base

This image contains a minimal Linux, glibc-based system. Supports most dynamically linked glibc applications (like Go apps that require libc/cgo).

### Image Content Overview

All contents from `discolix/static`, plus:

**Debian Packages**
* `libc6`
* `libssl`
* `openssl`
