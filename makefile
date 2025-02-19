OUT_DIR=build

.PHONY: clean build test install docs

build:
	mkdir -p $(OUT_DIR)
	go build -o $(OUT_DIR)/2rm ./src/main.go
	pandoc -s --to man ./README.md -o ./$(OUT_DIR)/2rm.1

build-program:
	mkdir -p $(OUT_DIR)
	go build -o $(OUT_DIR)/2rm ./src/main.go

test:
	go test ./src/...

clean:
	rm -rf $(OUT_DIR)

install:
	cp ./$(OUT_DIR)/2rm ~/.local/bin/2rm
	sudo cp ./$(OUT_DIR)/2rm.1 /usr/share/man/man1/2rm.1

docs:
	mkdir -p $(OUT_DIR)
	pandoc -s --to man ./README.md -o ./$(OUT_DIR)/2rm.1
