Discolix
========
![](https://github.com/discolix/discolix/workflows/build/badge.svg)

Discolix is based on the
[GoogleContainerTools/distroless](https://github.com/GoogleContainerTools/distroless)
project, but with a focus on support for popular ARM platforms.

## Overview

Discolix is a "distroless" language focused linux docker image project supporting
image bundles for the `linux_arm`, `linux_arm64` and `linux_amd64` platforms where
the `linux_amd64` image is capable of serving as a drop-in replacement for its
upstream variant (if one exists) and with the additional goal of providing a
foundation for "multi-arch" development using docker.

## Docker Images

**Hosted on DockerHub:** https://hub.docker.com/u/discolix

### Image Types
* `static`
* `base`
* `cc`
* `python`

### Manifest Lists

#### `discolix/[image_type]:latest`

The main `root` user image

| **Image** | **OS** | **Arch** |
|-------|:--:|:----:|
| <nobr>`discolix/[image_type]:latest-linux_arm`</nobr> | `linux` | `arm` |
| <nobr>`discolix/[image_type]:latest-linux_arm64`</nobr> | `linux` | `arm64` |
| <nobr>`discolix/[image_type]:latest-linux_amd64`</nobr> | `linux` | `amd64` |

#### `discolix/[image_type]:debug`

Same as `latest`, but with busybox installed at `/busybox` (example: `/busybox/sh`). Also `/busybox` added to `$PATH`

| **Image** | **OS** | **Arch** |
|-------|:--:|:----:|
| <nobr>`discolix/[image_type]:debug-linux_arm`</nobr> | `linux` | `arm` |
| <nobr>`discolix/[image_type]:debug-linux_arm64`</nobr> | `linux` | `arm64` |
| <nobr>`discolix/[image_type]:debug-linux_amd64`</nobr> | `linux` | `amd64` |

#### `discolix/[image_type]:nonroot`

Includes `/etc/password` entry for `nonroot` user

| **Image** | **OS** | **Arch** |
|-------|:--:|:----:|
| <nobr>`discolix/[image_type]:debug-linux_arm`</nobr> | `linux` | `arm` |
| <nobr>`discolix/[image_type]:debug-linux_arm64`</nobr> | `linux` | `arm64` |
| <nobr>`discolix/[image_type]:debug-linux_amd64`</nobr> | `linux` | `amd64` |

#### `discolix/[image_type]:debug-nonroot`

like `debug`, but with the addition of the `nonroot` user

| **Image** | **OS** | **Arch** |
|-------|:--:|:----:|
| <nobr>`discolix/[image_type]:debug-nonroot-linux_arm`</nobr> | `linux` | `arm` |
| <nobr>`discolix/[image_type]:debug-nonroot-linux_arm64`</nobr> | `linux` | `arm64` |
| <nobr>`discolix/[image_type]:debug-nonroot-linux_amd64`</nobr> | `linux` | `amd64` |
