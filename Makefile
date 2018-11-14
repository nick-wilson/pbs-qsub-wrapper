default_target: install

PREFIX=/app/pbs
LOG_PREFIX=/app/.qsub

.PHONY : install
install:
	install -o root -g nscc-proj -m 0751 -d $(LOG_PREFIX) && \
	install -o root -g nscc-proj -m 1773 -d $(LOG_PREFIX)/log && \
	install -o root -g nscc-proj -m 0750 -d $(LOG_PREFIX)/sbin && \
	install -o root -g nscc-proj -m 0755 -d $(PREFIX)/bin && \
	install -o root -g nscc-proj -m 0755 -t $(PREFIX)/bin qsub && \
	install -o root -g nscc-proj -m 0740 -t $(LOG_PREFIX)/sbin clean

.PHONY : test
test:
	cd tests && ./run
