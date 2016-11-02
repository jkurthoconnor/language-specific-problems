130: Ruby Foundations: More Topics
[Medium 2: Testing](https://launchschool.com/exercise_sets/c8bbfe96)

### 1. Make files for testing

### 2. Setup the Test Class - Cash Register

Let's start things from the ground up. We want to make a simple test suite for our CashRegister class. Setup the initial testing file. You don't have to have any tests in your test file. For this exercise, write everything you would need to start testing CashRegister, excluding the tests themselves (necessary requires, test class, etc.).

#### Solution:
```ruby
# cash_register_test.rb

require 'minitest/autorun'

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

### 3. Test Accept Money Method - Cash Register

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

### 4. Test Change Method - Cash Register

Write a test for the method, CashRegister#change.

#### Solution:
```ruby
def test_change
  transaction.amount_paid = 75
  assert_equal(25, register.change(transaction))
end
```

### 5. Test Give Receipt Method - Cash Register

Write a test for method CashRegister#give_receipt that ensures it displays a valid receipt.

#### Solution:

```ruby
def test_give_receipt
  message = "You've paid $50.\n"
  assert_output(message) { register.give_receipt(transaction) }
end

# or

def test_give_receipt
  assert_output("You've paid $#{transaction.item_cost}.\n") do
    register.give_receipt(transaction)
  end
end
```

### 6. Test Prompt For Payment Method- Transaction

Write a test that verifies that Transaction#prompt_for_payment sets the amount_paid correctly. We've changed the transaction class a bit to make testing this a bit easier.

```ruby
# transaction_test.rb
def test_prompt_for_payment
  message = "You owe $#{transaction.item_cost}.\nHow much are you paying?\n"
  cash = StringIO.new('100\n')
  assert_output(message) do
    transaction.prompt_for_payment(input: cash)
  end
  assert_equal(100, amount_paid)
end
```

### 7. Alter Prompt for Payment Method - Transaction

 Your task for this exercise is to make it so that we have "clean" output when running this test.
 
### Solution:
My test is already without the noise.

### 8. Swap Letters Sample Text and Starter File

Sample Text:

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sed vulputate ipsum.
Suspendisse commodo sem arcu. Donec a nisi elit. Nullam eget nisi commodo, volutpat
quam a, viverra mauris. Nunc viverra sed massa a condimentum. Suspendisse ornare justo
nulla, sit amet mollis eros sollicitudin et. Etiam maximus molestie eros, sit amet dictum
dolor ornare bibendum. Morbi ut massa nec lorem tincidunt elementum vitae id magna. Cras
et varius mauris, at pharetra mi.

Class and method to Test

```ruby
class Text
  def initialize(text)
    @text = text
  end

  def swap(letter_one, letter_two)
    @text.gsub(letter_one, letter_two)
  end
end
```

### 9. Test swap method - Text

For this exercise you'll be given a sample text file and a starter class [above]. The sample text's contents will be saved as a String to an instance variable in the starter class.

The Text class includes a #swap method that can be used to replace all occurrences of one letter in the text with another letter. And for this exercise we will swap all occurrences of 'a' with 'e'.

Your task is to write a test suite for class Text. In that test suite write a test for the Text method swap. For this exercise, you are required to use the minitest methods #setup and #teardown. The #setup method contains code that will be executed before each test; #teardown contains code that will be executed after each test.

### Solution:

```ruby
require 'minitest/autorun'
require_relative 'text'

class TextTest < MiniTest::Test
  attr_reader :text, :string

  def setup
    @file = File.open('sample2.txt', 'r')
    @string =  @file.read
    @text = Text.new(string)
  end

  def test_swap
    expected_string = string.gsub('a', 'e')
    assert_equal(expected_string, text.swap('a', 'e'))
  end

  def teardown
    @file.close
  end
end
```

### 10. Test word_count method - Text

Recall that in the last exercise we only had to test one method of our Text class. One of the useful facets of the setup and teardown methods is that they are automatically run before and after each test respectively. To show this we'll be adding one more method to our Text class, word_count.

```ruby
class Text
  # code omitted

  def word_count
    @text.split.count
  end
end
```

Write a test for this new method. Make sure to utilize the setup and teardown methods for any file related operations.

### Solution:

```ruby
class TextTest < MiniTest::Test
  attr_reader :text, :string

  def setup
    @file = File.open('sample2.txt', 'r')
    puts "File is now open for reading: {#@file.open?}"
    @string =  @file.read
    @text = Text.new(string)
  end

  def test_swap
    expected_string = string.gsub('a', 'e')
    assert_equal(expected_string, text.swap('a', 'e'))
  end
  
  def test_word_count
    expected_count = string.split.count
    assert_equal(expected_count, text.word_count)
  end

  def teardown
    @file.close
    puts "File is now closed: #{@file.closed?}"
  end
end
```
