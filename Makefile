MAINTAINER 	= indrasaputra

build.%: IMAGE=$*
build.%: VERSION=$(filter-out $@,$(MAKECMDGOALS))
build.%:
	docker build --no-cache -t $(MAINTAINER)/$(IMAGE):$(VERSION) -f $(IMAGE)/Dockerfile .

push.%: IMAGE=$*
push.%: VERSION=$(filter-out $@,$(MAKECMDGOALS))
push.%:
	docker push $(MAINTAINER)/$(IMAGE):$(VERSION)

build-all:
	make build.golang $(version)
	make build.protogen $(version)

push-all:
	make push.golang $(version)
	make push.protogen $(version)

%:
	@: