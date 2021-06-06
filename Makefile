REGISTRY	= docker.io
MAINTAINER 	= indrasaputra

build.%: IMAGE=$*
build.%: VERSION=$(filter-out $@,$(MAKECMDGOALS))
build.%:
	docker build --no-cache -t $(REGISTRY)/$(MAINTAINER)/$(IMAGE):$(VERSION) -f $(IMAGE)/Dockerfile .
	docker tag $(REGISTRY)/$(MAINTAINER)/$(IMAGE):$(VERSION) $(REGISTRY)/$(MAINTAINER)/$(IMAGE):latest

push.%: IMAGE=$*
push.%: VERSION=$(filter-out $@,$(MAKECMDGOALS))
push.%:
	docker push $(REGISTRY)/$(MAINTAINER)/$(IMAGE):$(VERSION)
	docker push $(REGISTRY)/$(MAINTAINER)/$(IMAGE):latest

build-all:
	make build.golang $(version)
	make build.protogen $(version)

push-all:
	make push.golang $(version)
	make push.protogen $(version)

%:
	@: