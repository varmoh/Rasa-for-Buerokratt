# Rasa-for-Buerokratt

### Installation

##### Building Rasa

- Run `docker build -t rasa .`

##### Building Rasa on Apple Silicon

- Run `docker build -f Dockerfile.m1 -t rasa .`

##### Docker compose example for running Bot using the built rasa image

##### Docker Compose:

```
version: "3.9"
services:
  train-bot:
    container_name: train-bot
    image: rasa
    ports:
      - 5005:5005
    volumes:
      - ./loba/:/app
    command:
      - train
      - --fixed-model-name
      - loba-model
    networks:
      - bykstack
    logging:
      driver: "json-file"
      options:
        max-size: "50m"
        max-file: "3"

  run-action-server:
    container_name: bot-action-server
    image: rasa
    ports:
      - 5055:5055
    volumes:
      - ./loba/actions:/app/actions
      - ./loba/data:/app/data
    command:
      - run
      - actions
    restart: always
    networks:
      - bykstack
    logging:
      driver: "json-file"
      options:
        max-size: "50m"
        max-file: "3"

  byk-bot:
    container_name: byk-bot
    image: rasa
    ports:
      - 5005:5005
    volumes:
      - ./loba/:/app
      - ./cc.et.300.bin:/app/fasttext_et_model/cc.et.300.bin #https://dl.fbaipublicfiles.com/fasttext/vectors-crawl/cc.et.300.bin.gz
    command:
      - run
    depends_on:
      train-bot:
        condition: service_completed_successfully
    restart: always
    networks:
      - bykstack
    logging:
      driver: "json-file"
      options:
        max-size: "50m"
        max-file: "3"

networks:
  bykstack:
    name: bykstack
    driver: bridge

```

Notes: loba directory referenced in docker compose: [loba](https://github.com/buerokratt/Installation-Guides/tree/main/default-setup/chatbot-and-training/bot/loba)
