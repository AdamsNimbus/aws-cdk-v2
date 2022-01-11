FROM node:16-alpine3.14
LABEL maintainer="adamsnimbus@gmail.com"

ARG CDK_VERSION
ADD requirements.txt /app/requirements.txt

RUN apk -v --update add \
	    python3 \
        py3-pip \
        bash \
        && \
    pip3 install \
        --upgrade pip \
        awscli

ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN npm install -g aws-cdk@"$CDK_VERSION" && \
    pip3 install -r /app/requirements.txt

# set default home directory for root
ENV HOME /home/node

# set default working directory to try and determine UID and GID
VOLUME ["/opt/app"]
WORKDIR /opt/app

ENTRYPOINT ["cdk"]
CMD ["--version"]
