# `discolix/static`

**DockerHub:** https://hub.docker.com/r/discolix/static

Statically compiled applications that do not require libc can use the `discolix/static` image.

### Image Contents

* ca-certificates
* A /etc/passwd entry for a root user
* A /tmp directory
* tzdata

# `discolix/base`

**DockerHub:** https://hub.docker.com/r/discolix/base

This image contains a minimal Linux, glibc-based system. Supports most dynamically linked glibc applications (like Go apps that require libc/cgo).

### Image Contents

All contents from `discolix/static`, plus:
* glibc
* libssl
* openssl
