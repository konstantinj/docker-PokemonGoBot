FROM java:jre
RUN apt-get update \
 && apt-get install -y git \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /PokemonGoBot
RUN VERSION=$(git ls-remote --tags https://github.com/jabbink/PokemonGoBot | grep -Po '[0-9]\.[0-9]\.[0-9](-alpha[0-9]*)?' | tail -n 1) \
 && wget -O /PokemonGoBot/config.properties https://raw.githubusercontent.com/jabbink/PokemonGoBot/master/config.properties.template \
 && wget -O /PokemonGoBot/pogo.scraper-all.jar https://github.com/jabbink/PokemonGoBot/releases/download/v${VERSION}/pogo.scraper-all-${VERSION}.jar
COPY run.sh /PokemonGoBot/
CMD ["./run.sh"]
