# The aws help commands won't work, as the aws-cli depends on 'groff'
# for formatting help in manpages style.
#
# Patching the source (https://github.com/aws/aws-cli/blob/v2/awscli/help.py#L108)
# seems more reasonable than installing groff with all of it's deps on alpine. (~160Mb)
#
# see https://github.com/aws/aws-cli/issues/1957
#     https://github.com/aws/aws-cli/issues/4940

FROM python:alpine

RUN apk update\
    && pip install --upgrade pip\
    && pip install aws-shell
ENTRYPOINT [ "aws-shell" ]
