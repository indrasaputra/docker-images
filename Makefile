MAINTAINER 	= indrasaputra

build.%: IMAGE=$*
build.%: VERSION=$(filter-out $@,$(MAKECMDGOALS))
build.%:
	docker build --no-cache -t $(MAINTAINER)/$(IMAGE):$(VERSION) -f $(IMAGE)/Dockerfile .
	docker tag $(MAINTAINER)/$(IMAGE):$(VERSION) $(MAINTAINER)/$(IMAGE):latest

push.%: IMAGE=$*
push.%: VERSION=$(filter-out $@,$(MAKECMDGOALS))
push.%:
	docker push $(MAINTAINER)/$(IMAGE):$(VERSION)
	docker push $(MAINTAINER)/$(IMAGE):latest

build-all:
	make build.golang $(version)
	make build.protogen $(version)

push-all:
	make push.golang $(version)
	make push.protogen $(version)

%:
	@: