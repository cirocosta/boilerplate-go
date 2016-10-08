package main

import (
	"fmt"
	"github.com/gorilla/handlers"
	"github.com/julienschmidt/httprouter"
	"log"
	"net/http"
	"os"
)

var (
	pingHandler = http.HandlerFunc(func(w http.ResponseWriter, _ *http.Request) {
		fmt.Fprint(w, "hue")
	})
)

func loggingMiddleware(next http.Handler) http.Handler {
	return handlers.LoggingHandler(os.Stderr, next)
}

func main() {
	router := httprouter.New()

	router.Handler("GET", "/ping", loggingMiddleware(pingHandler))
	router.NotFound = loggingMiddleware(http.FileServer(http.Dir("public")))

	log.Fatal(http.ListenAndServe(":80", router))
	log.Println("Listenning on port 80")
}
