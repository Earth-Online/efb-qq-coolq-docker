FROM python:3.6.7-alpine3.7
LABEL maintainer="linlanxi7552659@gmail.com"
COPY . /opt/app
WORKDIR /opt/app
ENV EFB_DATA_PATH  /opt/app/ehforward_config
ENV PROFILE default
RUN apk --no-cache --virtual build add build-base libffi-dev openssl-dev && apk --no-cache add jpeg-dev zlib-dev libmagic ffmpeg && pip install -r requirements.txt && rm -rf ~/.cache && apk del build
VOLUME /opt/app/ehforward_config/profiles/${PROFILE}/blueset.telegram/tadata.db
ENTRYPOINT ehforwarderbot -p ${PROFILE}
