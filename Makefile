
all: test
test: reasoner-test

reasoner-test: phenoscape-ext.owl
	owltools $< --run-reasoner -r elk -u > $@ && tail -100 $@ || (cat $@ && exit 1)
