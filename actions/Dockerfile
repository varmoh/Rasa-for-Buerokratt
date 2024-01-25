ARG rasa_sdk_version=rasa/rasa-sdk
FROM $rasa_sdk_version

WORKDIR /app

COPY ./pip.conf /etc/pip.conf
COPY ./requirements-actions.txt ./

USER root

RUN pip install -r requirements-actions.txt

USER 1001
