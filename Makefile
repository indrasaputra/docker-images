MAINTAINER 	= indrasaputra

build.%: IMAGE=$*
build.%: VERSION=$(filter-out $@,$(MAKECMDGOALS))
build.%:
	docker build -t $(MAINTAINER)/$(IMAGE):$(VERSION) -f $(IMAGE)/Dockerfile .

%:
	@: