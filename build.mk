BuildFlavour = perf

ifneq "$(BuildFlavour)" ""
include mk/flavours/$(BuildFlavour).mk
endif

V=0

STRIP_CMD = :