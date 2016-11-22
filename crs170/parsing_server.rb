require 'socket'

server = TCPServer.new('localhost', 3003)

loop do
  client = server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/
  puts request_line # output to terminal
  
  chunks = request_line.split[0, 2]
  http_method, path_and_q = chunks[0], chunks[1]
  
  path_and_params = path_and_q.split('?')
  path, param_str = path_and_params[0], path_and_params[1]
  
  params = {}
  param_str.split('&').each do |query|
    pair = query.split('=')
    key, value = pair[0], pair[1]
    params[key] = value
  end

  client.puts request_line # output to client
  client.puts rand(6) + 1
  client.close
end
