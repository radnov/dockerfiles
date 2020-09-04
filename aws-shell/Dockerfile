# The aws help commands won't work, as the aws-cli depends on 'groff'
# for formatting help in manpages style.
# Patching the source seems more reasonable than installing it. (~160Mb)
# see https://github.com/aws/aws-cli/issues/1957
FROM python:alpine

RUN apk update\
    && pip install --upgrade pip\
    && pip install aws-shell
ENTRYPOINT [ "aws-shell" ]
