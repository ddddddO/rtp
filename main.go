package main

import (
	"log"
	"net"
)

func main() {
	log.Println("start")

	conn, err := net.ListenPacket("udp", "localhost:8080")
	if err != nil {
		panic(err)
	}
	defer conn.Close()

	buf := make([]byte, 1500)
	for {
		length, remoteAddr, err := conn.ReadFrom(buf)
		if err != nil {
			panic(err)
		}
		log.Printf("\nreceived from %v ->\n%v", remoteAddr, buf[:length])
	}
}
