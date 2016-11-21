require 'socket'

server = TCPServer.new('localhost', 3003)

loop do
  client = server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/
  puts request_line # output to terminal

  client.puts request_line # output to client
  client.close
end
