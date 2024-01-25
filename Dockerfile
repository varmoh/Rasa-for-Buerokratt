ARG rasa_version=rasa/rasa
FROM $rasa_version

USER root

COPY ./rasa-nlu-examples /dependencies/rasa-nlu-examples

RUN apt-get update && apt-get install build-essential -y

EXPOSE 5005
