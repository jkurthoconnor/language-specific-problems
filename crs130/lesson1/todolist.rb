
class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
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

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

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
  
  def each
    index = 0
    until index == @todos.length
      yield(@todos[index])
      index += 1
    end

    self
  end
  
  def select
    selected = []
    self.each do |todo|
      selected.push(todo) if yield(todo)
    end

    selected
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
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")


list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list


todo4 = Todo.new('test alias')
puts list << todo4

todo2.done!

puts list
puts ""

results = list.select {|todo| todo.done? }

puts results.inspect
