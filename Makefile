VERSION=$(shell cat VERSION)
GIT_COMMIT=$(shell git rev-parse --short HEAD)

GOLDFLAGS="-X terraform-registry/internal/consts.VERSION=$(VERSION) -X terraform-registry/internal/consts.COMMIT=$(GIT_COMMIT)"

GOBUILD=go build -tags "jsoniter,$(BUILD_TAGS)" -ldflags $(GOLDFLAGS)

build:
	$(GOBUILD) -o bin/terraform-registry main.go