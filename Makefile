.PHONY: validate
validate: validate-ubuntu validate-python validate-node

.PHONY: validate-ubuntu
validate-ubuntu:
	@echo "Validating Ubuntu image"
	@packer validate ./packer/ubuntu.json

	@echo "Validating Ubuntu Dev image"
	@packer validate ./packer/ubuntu-dev.json

.PHONY: validate-python
validate-python:
	@echo "Validating Python image"
	@packer validate ./packer/python.json

.PHONY: validate-node
validate-node:
	@echo "Validating Node image"
	@packer validate ./packer/node.json

.PHONY: build
build: build-ubuntu build-python build-node

.PHONY: build-ubuntu
build-ubuntu:
	@echo "Building Ubuntu image"
	@packer build ./packer/ubuntu.json

	@echo "Building Ubuntu Dev image"
	@packer build ./packer/ubuntu-dev.json

.PHONY: build-python
build-python:
	@echo "Building Python image"
	@packer build ./packer/python.json

.PHONY: build-node
build-node:
	@echo "Building Node image"
	@packer build ./packer/node.json

.PHONY: release
release:
	@echo "Releasing images..."
	@sh ./release/release.sh
