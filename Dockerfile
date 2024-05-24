FROM rasa/rasa:3.5.2
USER root
RUN apt update && apt install netcat -y

COPY assets/config.yml /app/config.yml
COPY assets/domain.yml /app/domain.yml
