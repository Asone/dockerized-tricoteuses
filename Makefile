an-data-fetcher :
	docker-compose run assemblee cargo run -p tricoteuses_api_assemblee_open_data_fetcher -- -c Config.toml 
an-pics-fetcher :
	docker-compose run assemblee cargo run -p tricoteuses_api_assemblee_photos_fetcher -- -c Config.toml -v
hatvp-data-fetcher:
	docker-compose run hatvp cargo run -p tricoteuses_api_hatvp_fetcher -- -c Config.toml -v
wikidata-data-fetcher:
	docker-compose run wikidata cargo run -p tricoteuses_api_wikidata_fetcher -- -c Config.toml -v
all-data-fetch:
	docker-compose run assemblee cargo run -p tricoteuses_api_assemblee_open_data_fetcher -- -c Config.toml
	docker-compose run assemblee cargo run -p tricoteuses_api_assemblee_photos_fetcher -- -c Config.toml -v
	docker-compose run hatvp cargo run -p tricoteuses_api_hatvp_fetcher -- -c Config.toml -v
	docker-compose run wikidata cargo run -p tricoteuses_api_wikidata_fetcher -- -c Config.toml -v