.PHONY: validate
validate: validate-ubuntu validate-python validate-node

.PHONY: validate-ubuntu
validate-ubuntu:
	@echo "Validating Ubuntu image"
	@packer validate ./packer/ubuntu.json

	@echo "Validating Ubuntu full image"
	@packer validate ./packer/ubuntu-full.json

.PHONY: validate-python
validate-python:
	@echo "Validating Python image"
	@packer validate ./packer/python.json

	@echo "Validating Python full image"
	@packer validate ./packer/python-full.json

.PHONY: validate-node
validate-node:
	@echo "Validating Node image"
	@packer validate ./packer/node.json

	@echo "Validating Node full image"
	@packer validate ./packer/node-full.json

.PHONY: build
build: build-ubuntu build-python build-node

.PHONY: build-ubuntu
build-ubuntu:
	@echo "Building Ubuntu image"
	@packer build ./packer/ubuntu.json

	@echo "Building Ubuntu full image"
	@packer build ./packer/ubuntu-full.json

.PHONY: build-python
build-python:
	@echo "Building Python image"
	@packer build ./packer/python.json

	@echo "Building Python full image"
	@packer build ./packer/python-full.json

.PHONY: build-node
build-node:
	@echo "Building Node image"
	@packer build ./packer/node.json

	@echo "Building Node full image"
	@packer build ./packer/node-full.json

.PHONY: release
release:
	@echo "Releasing images..."
	@sh ./release/release.sh
