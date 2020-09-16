IGKA := jetalone/igka:0.0.1

VMS_RSA_FILENAME ?= vms_rsa

export

.PHONY: all apply destroy clean setup

all: apply

apply: init-azbi plan-azbi apply-azbi \
       init-azks plan-azks apply-azks

destroy: destroy-plan-azks destroy-azks \
         destroy-plan-azbi destroy-azbi

clean:
	@rm -rf $(M_SHARED_EXTERNAL)

.PHONY: init-azbi plan-azbi apply-azbi output-azbi destroy-plan-azbi destroy-azbi

init-azbi: setup
	@docker run --rm \
		-v $(M_SHARED_EXTERNAL):/shared \
		-t $(IGKA) \
		init

plan-igka: setup
	@docker run --rm \
		-v $(M_SHARED_EXTERNAL):/shared \
		-t $(IGKA) \
		plan
