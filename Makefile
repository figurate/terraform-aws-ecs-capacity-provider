SHELL:=/bin/bash
include .env

.PHONY: all clean validate test docs format

all: validate test docs format

clean:
	rm -rf .terraform/

validate:
	$(TERRAFORM) init && $(TERRAFORM) validate

test: validate
	$(CHECKOV) -d /work

docs:
	$(TERRAFORM_DOCS) markdown ./ >./README.md

format:
	$(TERRAFORM) fmt -list=true ./
