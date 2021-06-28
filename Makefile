BINARY=argocd-vault-plugin
VERSION=1.1.1
OS_ARCH=darwin_amd64

default: build

quality:
	go vet github.com/IBM/argocd-vault-plugin/...
	go test -v -coverprofile cover.out ./...

build:
	go build -o ${BINARY} .

release:
	goreleaser release --skip-publish --rm-dist --release-notes <(git-chglog "{{.Tag}}")

install: build

e2e: install
	./argocd-vault-plugin
