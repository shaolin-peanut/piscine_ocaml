DIRS := $(shell find . -maxdepth 1 -type d -name 'ex[0-9]*' -printf '%f\n' | sort -V)
SRCS := $(shell find $(DIRS) -name '*.ml')
RUN_TARGETS := $(addprefix run,$(shell seq 0 9))

all: $(DIRS)

$(DIRS):
	@echo "Compiling $@..."
	cd $@ && \
	for file in *.ml; do \
		if [ "$$file" != "main.ml" ]; then \
			ocamlopt -c $$file; \
		fi; \
	done && \
	ocamlopt -c main.ml && \
	ocamlopt -o $@ $$(ls *.cmx | grep -v main.cmx) main.cmx

clean:
	@echo "Cleaning up..."
	for dir in $(DIRS); do \
		rm -f $$dir/$$dir $$dir/*.cmx $$dir/*.o $$dir/*.cmi; \
	done

run%: ex%
	@echo "Running ex$*..."
	./ex$*/ex$*

.PHONY: all clean $(DIRS) $(RUN_TARGETS)
