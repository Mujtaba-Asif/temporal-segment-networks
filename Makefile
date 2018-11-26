DOCKER=nvidia-docker
DATA_DIR=/raid/masif
VOLUMES=-v $(PWD):/workspace/src -v $(DATA_DIR)/data:/workspace/data -v $(DATA_DIR)/log:/workspace/log -v $(DATA_DIR)/model:/workspace/model -v $(DATA_DIR)/temp:/workspace/temp -v $(DATA_DIR)/processed:/workspace/processed
DGX_OPTS=--shm-size=64g --ulimit memlock=-1 --ulimit stack=67108864

build:
	$(DOCKER) build --rm -t var-trainer -f Dockerfile .

run:
	$(DOCKER) run --rm -it --name var-trainer $(VOLUMES) $(DGX_OPTS) var-trainer
