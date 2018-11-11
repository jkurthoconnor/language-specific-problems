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

server = TCPServer.new("localhost", 3003)

loop do
  client = server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/
  puts request_line

  http_method, path, params = parse_request(request_line)
  # client.puts request_line # << this prevented the response from being understood; all text printed instead; inspector showed the entire output was wrapped in `<pre>` tags
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
  client.puts "<h1>Rolls!</h1>"

  params['rolls'].to_i.times do
    client.puts "<p>", rand(params['sides'].to_i) + 1, "</p>"
  end

  client.puts "</body>"
  client.puts "</html>"

  client.close
end
