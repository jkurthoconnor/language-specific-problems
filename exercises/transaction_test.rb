require 'minitest/autorun'
# require "minitest/reporters"
# Minitest::Reporters.use!

require_relative 'transaction'


class TransactionTest < Minitest::Test

  attr_accessor :transaction, :amount_paid, :total_cost

  def setup
    @transaction = Transaction.new(100)
  end

  def test_prompt_for_payment
    message = "You owe $#{transaction.item_cost}.\nHow much are you paying?\n"
    cash = StringIO.new('100\n')
    assert_output(message) do
      transaction.prompt_for_payment(input: cash)
    end

    assert_equal(100, transaction.amount_paid)
  end
end
