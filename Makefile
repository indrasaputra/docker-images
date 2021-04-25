REGISTRY 	= docker.pkg.github.com
MAINTAINER 	= indrasaputra

build.%: IMAGE=$*
build.%: VERSION=$(filter-out $@,$(MAKECMDGOALS))
build.%:
	docker build --no-cache -t $(REGISTRY)/$(MAINTAINER)/$(IMAGE):$(VERSION) -f $(IMAGE)/Dockerfile .

%:
	@: