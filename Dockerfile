FROM python:3.12-bookworm

ENV PATH "${PATH}:/pop-fe"

WORKDIR /pop-fe

RUN apt-get update && apt-get install -y \
  libsndfile-dev \
  ffmpeg \
  mame-tools \
  cmake && \
  rm -rf /var/lib/apt/lists/*

COPY . .

RUN ./pop-fe.py --install

ENTRYPOINT [ "python", "./pop-fe.py" ]
