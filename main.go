package main

import (
	"fmt"
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
		_, remoteAddr, err := conn.ReadFrom(buf)
		if err != nil {
			panic(err)
		}
		log.Printf("received from %v ->\n", remoteAddr)

		tmp := []byte{}
		for i := range buf {
			tmp = append(tmp, buf[i])

			if (i+1)%4 == 0 {
				fmt.Printf("%v\n", tmp)
				tmp = nil
			}
		}
	}
}
