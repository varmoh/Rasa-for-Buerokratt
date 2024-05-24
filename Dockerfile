FROM rasa/rasa:3.5.2
COPY assets/config.yml /app/config.yml
COPY assets/domain.yml /app/domain.yml
