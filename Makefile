builtFiles = versions FP-CLI.tgz

.PHONY: all
all: $(builtFiles)

.PHONY: clean
clean:
	rm -rf composer.phar src/versions vendor versions FP-CLI.docset FP-CLI.tgz

$(builtFiles): vendor
	php build.php

composer.phar:
	scripts/install-composer.sh

vendor: composer.phar
	php composer.phar install
