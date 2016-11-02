require 'minitest/autorun'
# require "minitest/reporters"
# Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  attr_reader :register, :transaction

  def setup
    @register = CashRegister.new(100)
    @transaction = Transaction.new(50)
  end

  def test_accept_money
    transaction.amount_paid = 50
    assert_equal(100, register.total_money)
    register.accept_money(transaction)
    assert_equal(150, register.total_money)
  end
  
  def test_change
    transaction.amount_paid = 75
    assert_equal(25, register.change(transaction))
  end
  
  def test_give_receipt
    message = "You've paid $50.\n"
    assert_output(message) { register.give_receipt(transaction) }
  end
end