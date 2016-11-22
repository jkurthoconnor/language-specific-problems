require 'socket'

def parse_request(request)
  method, path_and_querry, _null = request.split
  path, param_string = path_and_querry.split('?')

  params = param_string.split('&').each_with_object({}) do |query, hash|
    pair = query.split('=')
    hash[pair[0]] = pair[1]
  end

  [method, path, params]
end

server = TCPServer.new('localhost', 3003)

loop do
  client = server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/
  puts request_line

  http_method, path, params = parse_request(request_line)
  client.puts request_line
  client.puts http_method, path, params

  params['rolls'].to_i.times do
    client.puts rand(params['sides'].to_i) + 1
  end
  client.close
end
