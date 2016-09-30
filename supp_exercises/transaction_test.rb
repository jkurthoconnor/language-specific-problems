require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'transaction'


class TransactionTest < Minitest::Test

  attr_accessor :transaction, :amount_paid, :total_cost

  def setup
    @transaction = Transaction.new(100)
  end

  def test_prompt_for_payment
    
  end
end

# def prompt_for_payment(input: $stdin) # We've set a default parameter for stdin
#   loop do
#     puts "You owe $#{item_cost}.\nHow much are you paying?"
#     @amount_paid = input.gets.chomp.to_f # notice that we call gets on that parameter
#     break if valid_payment? && sufficient_payment?
#     puts 'That is not the correct amount. ' \
#          'Please make sure to pay the full cost.'
#   end
# end