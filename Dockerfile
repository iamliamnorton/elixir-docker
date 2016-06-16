FROM trenpixster/elixir

WORKDIR /app

ADD . .

VOLUME ["/app"]

CMD ["iex"]
