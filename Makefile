SHELL:=/bin/bash
AWS_DEFAULT_REGION=ap-southeast-2

ifneq (, $(shell which docker))
TERRAFORM_VERSION=0.14.7
TERRAFORM=docker run --rm -v "${PWD}:/work" -e AWS_DEFAULT_REGION=$(AWS_DEFAULT_REGION) -e http_proxy=$(http_proxy) --net=host -w /work hashicorp/terraform:$(TERRAFORM_VERSION)
else
TERRAFORM=terraform
endif

TERRAFORM_DOCS=docker run --rm -v "${PWD}:/work" tmknom/terraform-docs

CHECKOV=docker run -t -v "${PWD}:/work" bridgecrew/checkov

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
