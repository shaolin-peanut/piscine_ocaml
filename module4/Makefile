DIRS := $(shell find . -maxdepth 1 -type d -name 'ex[0-9]*' -printf '%f\n' | sort -V)
SRCS := $(shell find $(DIRS) -name '*.ml')
RUN_TARGETS := $(addprefix run,$(shell seq 0 9))

all: $(DIRS)

$(DIRS):
	@echo "Compiling $@..."
	@if ls $@/*.ml >/dev/null 2>&1; then \
		cd $@ && \
		for file in *.ml; do \
			if [ "$$file" != "main.ml" ]; then \
				ocamlopt -c $$file; \
			fi; \
		done && \
		ocamlopt -c main.ml && \
		ocamlopt -o $@ *.cmx; \
	else \
		echo "No .ml files found in $@, skipping..."; \
	fi

clean:
	@echo "Cleaning up..."
	for dir in $(DIRS); do \
		rm -f $$dir/$$dir $$dir/*.cmx $$dir/*.o $$dir/*.cmi; \
	done

run%: ex%
	@echo "Running ex$*..."
	./ex$*/ex$*

.PHONY: all clean $(DIRS) $(RUN_TARGETS)
