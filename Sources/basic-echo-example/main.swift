import Venice
import TCP

let statusCh = Channel<Bool>()

co {
    do {
        // create an echo server on localhost:8080
        let host = "127.0.0.1"
        let port = 8080
        let server = try TCPServer(host: host, port: port)
        print("TCPServer started at \(host):\(port)")

        // send status for the client to connect
        statusCh.send(true)

        while true {
            // waits for an incoming connection, receives 1024 bytes, sends them back
            let connection = try server.accept()
            let data = try connection.receive(upTo: 1024)
            try connection.send(data)
        }
    } catch {
        print(error)
        statusCh.send(false)
  }
}

// wait for the server to start
guard statusCh.receive()! else {
    print("Server could not start")
    exit(1)
}

// create a connection to server at localhost:8080
let connection = try TCPConnection(host: "127.0.0.1", port: 8080)

// opens the connection, sends "hello"
try connection.open()
try connection.send("hello")

// waits for the echo message, prints it out
let data =  try connection.receive(upTo: 1024)
print(data)
