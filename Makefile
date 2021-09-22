help: ## Display help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

generate: ## generate website from notion
	@notablog generate .

deploy: ## firebase deploy blog
	@notablog generate . && \
		firebase deploy --only hosting:anonacyblog

learn: ## deploy learn
	@cp config_learn.json config.json && \
		notablog generate . && \
		firebase deploy --only hosting:anonacylearn && \
		cp config_blog.json config.json