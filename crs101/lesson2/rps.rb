VALID_CHOICES = ['rock', 'paper', 'scissors']

def prompt(message)
  Kernel.puts("=> message")
end

loop do
  prompt("Choose one: #{VALID_CHOICES.join(', ')}")
  choice = Kernel.gets().chomp()
