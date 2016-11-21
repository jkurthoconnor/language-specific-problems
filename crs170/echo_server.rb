require 'socket'

server = TCPServer.new('localhost', 3003)

loop do
  client = server.accept

  request_line = client.gets
  puts request_line # output to terminal

  client.puts request_line # output to client
  client.close
end