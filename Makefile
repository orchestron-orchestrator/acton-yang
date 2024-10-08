# schema.act is generated by rfcgen.act by reading the YANG RFC 7950, which is
# stored in the rfc module.

all: src/yang/schema.act
	acton build

src/yang/schema.act: schema-header.act out/bin/rfcgen schema-footer.act
	(tail -n +4 schema-header.act && out/bin/rfcgen && cat schema-footer.act) > src/yang/schema.act

out/bin/rfcgen: src/rfcgen.act
	acton src/rfcgen.act

.PHONY: clean
clean:
	rm -rf out

