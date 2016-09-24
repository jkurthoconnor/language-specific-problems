
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

# ---- Adding to the list -----
# add

list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list
# list.add(1)                     # raises TypeError with message "Can only add Todo objects"

# << 
# same behavior as add

todo4 = Todo.new('test alias')
puts list << todo4
puts ""

# ---- Interrogating the list -----
# size

puts list.size                       # returns 4
puts ""
# 
# first
puts list.first                      # returns todo1, which is the first item in the list
puts ""
# 
# last
puts list.last                       # returns todo4, which is the last item in the list
puts ""
# 
# ---- Retrieving an item in the list ----
# item_at

# puts list.item_at                    # raises ArgumentError
puts list.item_at(1)                 # returns 2nd item in list (zero based index)
puts ""
# puts list.item_at(100)               # raises IndexError
# 
# ---- Marking items in the list -----
# mark_done_at

# list.mark_done_at               # raises ArgumentError
list.mark_done_at(1)            # marks the 2nd item as done
puts todo2
puts ""
# list.mark_done_at(100)          # raises IndexError
# 
# mark_undone_at

# list.mark_undone_at             # raises ArgumentError
list.mark_undone_at(1)          # marks the 2nd item as not done,
puts todo2
puts ""
# list.mark_undone_at(100)        # raises IndexError

# ---- Deleting from the the list -----

# shift
# puts list.shift                      # removes and returns the first item in list
# puts ""

# pop
# puts list.pop                        # removes and returns the last item in list
# puts ""

# remove_at
# list.remove_at                  # raises ArgumentError
# puts list.remove_at(1)                 # removes and returns the 2nd item
# puts ""
# puts list.remove_at(100)             # raises IndexError
# 
# ---- Outputting the list -----

# to_s
puts list.to_s                      # returns string representation of the list
puts ""

# ---- Today's Todos ----
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym

# or, if any todos are done

# ---- Today's Todos ----
# [ ] Buy milk
# [X] Clean room
# [ ] Go to gym

list.each do |todo|
  puts todo
end
