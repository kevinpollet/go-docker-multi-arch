package main

import (
	"fmt"
	"log"
	"os"
	"runtime"
)

func main() {
	_, err := fmt.Fprintf(os.Stdout, "Hello from %q\n", runtime.GOARCH)
	if err != nil {
		log.Fatal(err)
	}
}
