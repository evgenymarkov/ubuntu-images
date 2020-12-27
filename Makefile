.PHONY: validate
validate: validate-ubuntu validate-python validate-node

.PHONY: validate-ubuntu
validate-ubuntu:
	@echo "Validating Ubuntu minimal image"
	@packer validate ./packer/ubuntu-minimal.json

	@echo "Validating Ubuntu full image"
	@packer validate ./packer/ubuntu-full.json

.PHONY: validate-python
validate-python:
	@echo "Validating Python minimal image"
	@packer validate ./packer/python-minimal.json

	@echo "Validating Python full image"
	@packer validate ./packer/python-full.json

.PHONY: validate-node
validate-node:
	@echo "Validating Node minimal image"
	@packer validate ./packer/node-minimal.json

	@echo "Validating Node full image"
	@packer validate ./packer/node-full.json

.PHONY: build
build: build-ubuntu build-python build-node

.PHONY: build-ubuntu
build-ubuntu:
	@echo "Building Ubuntu minimal image"
	@packer build ./packer/ubuntu-minimal.json

	@echo "Building Ubuntu full image"
	@packer build ./packer/ubuntu-full.json

.PHONY: build-python
build-python:
	@echo "Building Python minimal image"
	@packer build ./packer/python-minimal.json

	@echo "Building Python full image"
	@packer build ./packer/python-full.json

.PHONY: build-node
build-node:
	@echo "Building Node minimal image"
	@packer build ./packer/node-minimal.json

	@echo "Building Node full image"
	@packer build ./packer/node-full.json

.PHONY: release
release:
	@echo "Releasing images..."
	@sh ./release/release.sh
