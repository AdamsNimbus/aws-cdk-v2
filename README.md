[![Create and publish a Docker image](https://github.com/AdamsNimbus/aws-cdk-v2/actions/workflows/container-build.yml/badge.svg?branch=main)](https://github.com/AdamsNimbus/aws-cdk-v2/actions/workflows/container-build.yml)

AWS CDK v2 Container
===

A simple container with AWS CDK v2 ([Python based](https://docs.aws.amazon.com/cdk/v2/guide/work-with-cdk-python.html)) configured.

# How to use?

Simply build the image locally using `make build` (Docker must be installed locally)

and run it with all needed params:

```cmd
docker run --rm \
    -v .:/opt/app:rw \
    -e AWS_ACCESS_KEY_ID \
    -e AWS_SECRET_ACCESS_KEY \
    -e AWS_DEFAULT_REGION \
    -e CDK_DEFAULT_ACCOUNT \
    -e CDK_DEFAULT_REGION \
     cdk_v2_local:2.3.0
```
Or with docker-compose:
```yaml
version: "3.2"
services:
  cdk:
    image: cdk_v2_local:2.3.0
    userns_mode: host
    user: node
    working_dir: /opt/app
    volumes:
    - .:/opt/app:rw
    environment:
      - AWS_ACCESS_KEY_ID
      - AWS_SECRET_ACCESS_KEY
      - AWS_DEFAULT_REGION
      - CDK_DEFAULT_ACCOUNT
      - CDK_DEFAULT_REGION
```

Replace `image:` with `ghcr.io/adamsnimbus/aws-cdk-v2:2.3.0` for pulling from ghcr.

All automated builds are handled by Github Actions.

## Build variables

Actions uses the following variables for configuration, configured in [container-build.yml](.github/workflows/container-build.yml)

|Available variables     |Default value        |Description                                         |
|------------------------|---------------------|----------------------------------------------------|
|`CDK_VERSION`    |2.3.0           |Version of AWS CDK v2 that is packaged|
|`REGISTRY`    |ghcr.io           |Always use Github registry           |
|`IMAGE_NAME` |aws-cdk-v2|Defaults to `${{ github.repository }}`          |

# License

Everything in [this repository](https://github.com/AdamsNimbus/aws-cdk-v2) is published under [GPL-3](https://spdx.org/licenses/GPL-3.0-or-later.html).

## Issues

If you have any problems with or questions about this image, please contact us through a [GitHub issue](https://github.com/AdamsNimbus/aws-cdk-v2/issues).

