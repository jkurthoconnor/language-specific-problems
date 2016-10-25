130: Ruby Foundations: More Topics
[Medium 2: Testing](https://launchschool.com/exercise_sets/c8bbfe96)

### 1. Make files for testing

### 2. Setup the Test Class - Cash Register

Let's start things from the ground up. We want to make a simple test suite for our CashRegister class. Setup the initial testing file. You don't have to have any tests in your test file. For this exercise, write everything you would need to start testing CashRegister, excluding the tests themselves (necessary requires, test class, etc.).

#### Solution:
```ruby
# cash_register_test.rb

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  attr_reader :register, :transaction

  def setup
    @register = CashRegister.new(100)
    @transaction = Transaction.new(50)
  end
end
```

### 2. Test Accept Money Method - Cash Register

We now have the foundation of our CashRegister test class set up. Let's start testing! We'll start with the CashRegister#accept_money method. Write a test for the #accept_money method.

#### Solution:
```ruby
  def test_accept_money
    transaction.amount_paid = 50
    assert_equal(100, register.total_money)
    register.accept_money(transaction)
    assert_equal(150, register.total_money)
  end
```

### 3. Test Change Method - Cash Register

Write a test for the method, CashRegister#change.

#### Solution:
```ruby
def test_change
  transaction.amount_paid = 75
  assert_equal(25, register.change(transaction))
end
```

### 4. Test Give Receipt Method - Cash Register

Write a test for method CashRegister#give_receipt that ensures it displays a valid receipt.

#### Solution:

```ruby
def test_give_receipt
  message = "You've paid $50.\n"
  assert_output(message) { register.give_receipt(transaction) }
end
```

### 5. Test Prompt For Payment Method- Transaction

Write a test that verifies that Transaction#prompt_for_payment sets the amount_paid correctly. We've changed the transaction class a bit to make testing this a bit easier.

```ruby
```