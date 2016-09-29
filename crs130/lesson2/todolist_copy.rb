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
