require 'socket'

def parse_request(request)
  method, path_and_querry, _null = request.split
  path, param_string = path_and_querry.split('?')

  params = (param_string || "").split('&').each_with_object({}) do |query, hash|
    pair = query.split('=')
    hash[pair[0]] = pair[1]
  end

  [method, path, params]
end

server = TCPServer.new("localhost", 3003)

loop do
  client = server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/
  puts request_line

  http_method, path, params = parse_request(request_line)

  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/html"
  client.puts
  client.puts "<html>"
  client.puts "<body>"
  client.puts "<pre>"
  client.puts http_method
  client.puts path
  client.puts params
  client.puts "</pre>"

  client.puts "<h1>Counter</h1>"
  number = params["number"].to_i

  client.puts "<p>The current number is #{number}</p>"
  client.puts "<p><a href='/?number=#{number + 1}'>Increase number</a></p>"
  client.puts "<p><a href='/?number=#{number - 1}'>Decrease number</a></p>"


  client.puts "</body>"
  client.puts "</html>"

  client.close
end

# since HTTP is stateless, there is nowhere to store the current number;
# must provide `number` with each request