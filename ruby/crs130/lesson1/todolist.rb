# This class represents a todo item and its
# related data and status as done/undone.
class Todo
  DONE_MARKER = 'X'.freeze
  UNDONE_MARKER = ' '.freeze

  attr_accessor :title, :description, :done

  def initialize(title, description = '')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone?
    !done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

# This class represents a collection of Todo items.
class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def to_s
    header = "---- #{title} ----\n"
    header + @todos.map(&:to_s).join("\n")
  end

  def to_a
    @todos
  end

  def each
    index = 0
    until index == @todos.length
      yield(@todos[index])
      index += 1
    end

    self
  end

  def select
    selected = TodoList.new("Selections from #{title}")
    each do |todo|
      selected.add(todo) if yield(todo)
    end

    selected
  end

  def find_by_title(string)
    @todos.each do |todo|
      return todo if todo.title == string
    end
    nil
  end

  def mark_item_done(title)
    return 'No task by that title!' if find_by_title(title).nil?
    find_by_title(title).done!
  end

  def mark_all_done
    @todos.each do |todo|
      todo.done!
    end
  end

  def mark_all_undone
    @todos.each do |todo|
      todo.undone!
    end
  end

  def id_all_done_items
    @todos.select { |todo| todo.done? }
  end

  def id_all_undone_items
    @todos.select { |todo| todo.undone? }
  end

  def done?
    @todos.each do |todo|
      return false unless todo.done?
    end
    true
  end

  def add(todo_object)
    raise TypeError, 'Can only add Todo objects' unless todo_object.instance_of?(Todo)
    @todos.push(todo_object)

    alias << add

    @todos
  end

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def item_at(index)
    raise IndexError if index >= @todos.size
    @todos[index]
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def remove_at(index)
    @todos.delete(item_at(index))
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end
end

# given
todo1 = Todo.new('Buy milk')
todo2 = Todo.new('Clean room')
todo3 = Todo.new('Go to gym')
list = TodoList.new("Today's Todos")

puts list.add(todo1)                 # adds todo1 to end of list, returns list
puts list.add(todo2)                 # adds todo2 to end of list, returns list
puts list.add(todo3)                 # adds todo3 to end of list, returns list

todo4 = Todo.new('test alias')
puts list << todo4
todo2.done!
puts list
puts ''
puts todo2.undone?
puts todo2.done?
puts ''
puts list.done?
list.mark_all_done
puts list
puts list.done?
list.mark_all_undone
puts list
puts list.done?
puts ''
puts list.id_all_undone_items
todo3.done!
puts ''
puts list.id_all_done_items
puts ''
puts list.find_by_title('Clean room')
list.mark_item_done('Clean room')
puts list
p list.find_by_title('do stuff')
puts list.mark_item_done('do stuff')
