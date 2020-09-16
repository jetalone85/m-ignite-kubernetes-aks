define M_METADATA_CONTENT
labels:
  version: $(M_VERSION)
  name: Ignite
  short: $(M_MODULE_SHORT)
  kind: application
  provider: kubernetes
endef

define M_CONFIG_CONTENT
kind: $(M_MODULE_SHORT)-config
$(M_MODULE_SHORT):
  name: ignite
endef

define M_STATE_INITIAL
kind: state
$(M_MODULE_SHORT):
  status: initialized
endef
