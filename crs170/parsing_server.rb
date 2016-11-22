require 'socket'

server = TCPServer.new('localhost', 3003)

loop do
  client = server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/
  puts request_line # output to terminal

  http_method, path_and_q, _null = request_line.split
  path, param_str = path_and_q.split('?')

  params = param_str.split('&').each_with_object({}) do |query, hash|
    pair = query.split('=')
    hash[pair[0]] = pair[1]
  end

  client.puts request_line # output to client
  client.puts http_method, path, params
  client.puts rand(6) + 1
  client.close
end
