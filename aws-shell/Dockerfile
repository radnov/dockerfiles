FROM python:alpine

RUN apk update\
    && pip install --upgrade pip\
    && pip install aws-shell
ENTRYPOINT [ "aws-shell" ]
