# schema.act is generated by rfcgen.act by reading the YANG RFC 7950, which is
# stored in the rfc module.

all: src/yang/schema.act
	acton build

.PHONY: gen
gen: src/yang/schema.act

src/yang/schema.act: gen/schema-header.act gen/schema-footer.act gen/out/bin/rfcgen
	cd gen && out/bin/rfcgen > ../src/yang/schema.act

gen/out/bin/rfcgen: gen/src/rfcgen.act
	cd gen && acton build

.PHONY: clean
clean:
	rm -rf out

.PHONY: test
test:
	acton test
	$(MAKE) test-daclass
	$(MAKE) test-data-source-roundtrip

.PHONY: test-daclass
test-daclass:
	cd test/test_data_classes_gen && acton build && out/bin/gen
	cd test/test_data_classes && acton test

.PHONY: test-data-source-roundtrip
test-data-source-roundtrip:
	cd test/test_data_source_roundtrip && acton test

.PHONY: test-golden-update
test-golden-update:
	acton test --golden-update
	cd test/test_data_classes_gen && acton build && out/bin/gen
	cd test/test_data_classes && acton test --golden-update
	cd test/test_data_source_roundtrip && acton test --golden-update
