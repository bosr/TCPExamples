import Venice
import TCP

co {
  do {
    let server = try TCPServer(host: "127.0.0.1", port: 8080)
    let connection = try server.accept()
    let data = try connection.receive(upTo: 1024)
    try connection.send(data)
  } catch {
    print(error)
  }
}

nap(for: 200.milliseconds)

let connection = try TCPConnection(host: "127.0.0.1", port: 8080)
try connection.open()
try connection.send("hello")
let data =  try connection.receive(upTo: 1024)
print(data)
