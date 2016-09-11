import Venice
import TCP
import protocol C7.Stream

func echo(on connection: Stream) {
    do {
        while true {
            let data = try connection.receive(upTo: 1024)
            try connection.send(data)
        }
    } catch {
        print(error)
    }
}

co {
    do {
        // create an echo server on localhost:8080
        let host = "127.0.0.1"
        let port = 8080
        let server = try TCPServer(host: host, port: port)
        print("TCPServer started at \(host):\(port)")

        while true {
            // waits for an incoming connection, receives 1024 bytes, sends them back
            let connection = try server.accept()
            // handle the connection using a coroutine
            co(echo(on: connection))
        }
    } catch {
        print(error)
  }
}

// wait forever
let done = Channel<Void>()
_ = done.receive()
