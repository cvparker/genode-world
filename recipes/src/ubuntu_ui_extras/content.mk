MIRROR_FROM_REP_DIR := lib/mk/ubuntu-ui-extras.mk

content: $(MIRROR_FROM_REP_DIR)

$(MIRROR_FROM_REP_DIR):
	$(mirror_from_rep_dir)

PORT_DIR := $(call port_dir,$(REP_DIR)/ports/ubuntu-ui-extras)

MIRROR_FROM_PORT_DIR := src/lib/ubuntu-ui-extras

content: $(MIRROR_FROM_PORT_DIR)

$(MIRROR_FROM_PORT_DIR):
	mkdir -p $(dir $@)
	cp -r $(PORT_DIR)/$@ $(dir $@)

content: src/lib/ubuntu-ui-extras/target.mk

src/lib/ubuntu-ui-extras/target.mk: $(MIRROR_FROM_PORT_DIR)
	mkdir -p $(dir $@)
	echo "LIBS = ubuntu-ui-extras" > $@

content: LICENSE

LICENSE:
	cp $(PORT_DIR)/src/lib/ubuntu-ui-extras/COPYING $@
