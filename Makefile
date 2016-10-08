GO		?=	go
GOFMT	:=	gofmt -s -w
BIN		:=	boilerplate
SRCS	:=	$(shell find . -name "*.go" -type f ! -name "*_test.go")


all: $(BIN) test

$(BIN): $(SRCS)
	$(GO) build -o $(BIN)


.PHONY: test clean fmt run glide


run: $(BIN)
	./$(BIN)


glide:
	curl https://glide.sh/get | sh
	glide install

fmt:
	$(GOFMT) .

test:
	$(GO) test -v

clean:
	find . -name "$(BIN)" -delete
