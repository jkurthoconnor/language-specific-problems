require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!
require 'simplecov'
SimpleCov.start

require_relative 'todolist_copy'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)  
    assert_equal([@todo1, @todo2], @list.to_a) # this line shows that the methods aren't being called with each test; if they were the `shift` call from previous test should persist.
  end

  def test_done?
    assert_equal(false, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
    assert_equal(false, @list.done?)
  end

  def test_add_alias
    todo4 = Todo.new('test this thing')
    assert_equal(@list.add(todo4), @todos << todo4) # `list.add` returns resulting @todos
  end

  def test_add_raise_type_error
    assert_raises(TypeError) { @list.add('get shoe laces') }
    assert_raises(TypeError)  { @list.add('get shoe laces') }
    assert_raises(TypeError)  { @list.add([1, 2]) }
    assert_raises(TypeError)  { @list.add(1) }
    assert_raises(TypeError)  { @list.add({a: 2, b: 3}) }
  end

  def test_add_alias_raise_type_error
    assert_raises(TypeError) { @list << ('get shoe laces') }
    assert_raises(TypeError)  { @list << ('get shoe laces') }
    assert_raises(TypeError)  { @list << ([1, 2]) }
    assert_raises(TypeError)  { @list << (1) }
    assert_raises(TypeError)  { @list << ({a: 2, b: 3}) }
  end

  def test_item_at
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo2, @list.item_at(1))
    assert_equal(@todo3, @list.item_at(2))
    assert_raises(IndexError) { @list.item_at(3) }
  end

  def test_mark_done_at
    @list.mark_done_at(0)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
    assert_raises(IndexError) { @list.mark_done_at(10)}
  end

  def test_mark_undone_at
    @todo1.done!
    @todo3.done!
    @list.mark_undone_at(0)
    assert_equal(true, @todo1.undone?)
    assert_equal(true, @todo2.undone?)
    assert_equal(false, @todo3.undone?)
    assert_raises(IndexError) { @list.mark_undone_at(1010) }
  end

  def test_mark_all_done
    @list.mark_all_done
    assert_equal(true, @list.done?)
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_remove_at
    @list.remove_at(2)
    assert_raises(IndexError) {@list.item_at(2) }
  end

  def test_to_s
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_one_done
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    @list.mark_done_at(0)
    assert_equal(output, @list.to_s)
  end

  def test_to_s_all_done
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    @list.mark_all_done
    assert_equal(output, @list.to_s)
  end

  def test_each_iteration
    comparison = []
    @list.each { |item| comparison.push(item)}
    assert_equal(@todos, comparison)
  end

  def test_each_return
    assert_equal(@list, @list.each { |item| true } )
  end

  def test_select
    @list2 = TodoList.new("Selections from Today's Todos")
    @list2.add(@todo1)

    selection = @list.select {|item| item.title.include?("Buy")} 
    assert_equal(@list2.to_s, selection.to_s)
  end

end
