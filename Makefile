GO		?=	go
GOFMT	:=	gofmt -s -w
BIN		:=	boilerplate
SRCS	:=	$(shell find . -name "*.go" -type f ! -name "*_test.go")


all: $(BIN) test

$(BIN): fmt $(SRCS)
	$(GO) build -o $(BIN)


.PHONY: test clean fmt run


run: $(BIN)
	$(BIN) -p 80

fmt:
	$(GOFMT) .

test:
	$(GO) test -v

clean:
	find . -name "$(BIN)" -delete
