NAME      = hello3
DOCKERIMG = perweij/amigaos-cross-toolchain:latest
PROJDIR   = $(PWD)
PROJMOUNT = /tmp/proj

RUNCMD = docker run -v $(PROJDIR)\:$(PROJMOUNT) --rm \
         -v /tmp/.X11-unix\:/tmp/.X11-unix -e DISPLAY \
         --net=host --device=/dev/snd --device=/dev/video0  --ipc=host \
         -i -t $(DOCKERIMG)

### Executed on host
.PHONY: all
all:
	$(RUNCMD) bash -c "cd $(PROJMOUNT) && env NAME=$(NAME) make -f Makefile.docker all"

run:
	xhost +
	$(RUNCMD) /bin/bash -i -c "fs-uae $(PROJMOUNT)/a1200.fs-uae --floppy_drive_0=$(PROJMOUNT)/$(NAME).adf >/dev/null"

bash:
	xterm -e /bin/bash -i

clean:
	$(RUNCMD) bash -c "cd $(PROJMOUNT) && env NAME=$(NAME) make -f Makefile.docker docker-clean"
