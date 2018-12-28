### Exercises for Launch School Course 120, Lesson 4: [Hard 1](https://launchschool.com/lessons/f1c58be0/assignments/928366dd)

1) Alyssa has been assigned a task of modifying a class that was initially created to keep track of secret information. The new requirement calls for adding logging, when clients of the class attempt to access the secret data. Here is the class in its current form:
```ruby
class SecretFile
  attr_reader :data

  def initialize(secret_data)
    @data = secret_data
  end
end
```

She needs to modify it so that any access to data must result in a log entry being generated. That is, any call to the class which will result in data being returned must first call a logging class. The logging class has been supplied to Alyssa and looks like the following:

```ruby
class SecurityLogger
  def create_log_entry
    # ... implementation omitted ...
  end
end
```

Hint: Assume that you can modify the initialize method in SecretFile to have an instance of SecurityLogger be passed in as an additional argument. It may be helpful to review the lecture on collaborator objects for this exercise.

Solution:
```ruby
class SecretFile    
  def initialize(secret_data, log)
    @data = secret_data
    @log = log
  end
  
  def access_data
    @log.create_log_entry
    @data
  end
end

class SecurityLogger
  attr_reader :access
  
  def initialize
    @access = 0
  end
  
  def create_log_entry
    @access += 1
  end
end
```
However, since we want always to log access to every `SecretFile` object, why add one more thing to forget? So it might make sense to not pass in the `SecurityLogger` as an argument, and instead simply initialize the collaborator object. Like this:
```ruby
class SecretFile    
  def initialize(secret_data)
    @data = secret_data
    @log = SecurityLogger.new
  end
  
  def access_data
    @log.create_log_entry
    @data
  end
end

class SecurityLogger
  attr_reader :access
  
  def initialize
    @access = 0
  end
  
  def create_log_entry
    @access += 1
  end
end
```

2) Ben and Alyssa are working on a vehicle management system. So far, they have created classes called Auto and Motorcycle to represent automobiles and motorcycles. After having noticed common information and calculations they were performing for each type of vehicle, they decided to break out the commonality into a separate class called WheeledVehicle. This is what their code looks like so far:

```ruby
class WheeledVehicle
  attr_accessor :speed, :heading

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    @fuel_efficiency = km_traveled_per_liter
    @fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures
    super([20,20], 80, 8.0)
  end
end
```
Now Alan has asked them to incorporate a new type of vehicle into their system - a Catamaran defined as follows:

```ruby
class Catamaran
  attr_accessor :propeller_count, :hull_count, :speed, :heading

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    # ... code omitted ...
  end
end
```

This new class does not fit well with the object hierarchy defined so far. Catamarans don't have tires. But we still want common code to track fuel efficiency and range. Modify the class definitions and move code into a Module, as necessary, to share code among the Catamaran and the wheeled vehicles.

Solution:

```ruby
module Vehicle
  attr_accessor :speed, :heading
  attr_writer :fuel_efficiency, :fuel_capacity

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class WheeledVehicle
  include Vehicle

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures
    super([20,20], 80, 8.0)
  end
end

class Catamaran
  include Vehicle

  attr_accessor :propeller_count, :hull_count

  def initialize(num_propellers, num_hulls, km_traveled_per_liter=20, liters_of_fuel_capacity=100)
    @propeller_count = num_propellers
    @hull_count = num_hulls
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end
end
```

3) Building on the prior vehicles question, we now must also track a basic motorboat. A motorboat has a single propeller and hull, but otherwise behaves similar to a catamaran. Therefore, creators of Motorboat instances don't need to specify number of hulls or propellers. How would you modify the vehicles code to incorporate a new Motorboat class?

Solution:

I would create a `HulledVehicle` class from which both `Catamaran` and `Motorboat` inherit.  The `Vehicle` module would be included in `HulledVehicle`.  The initializer would be moved to the `HulledVehicle` class, with specific values being passed in from the `Catamaran` and `Motorboat` at instantiation.

```ruby
module Vehicle
  attr_accessor :speed, :heading
  attr_writer :fuel_efficiency, :fuel_capacity

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class WheeledVehicle
  include Vehicle

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures
    super([20,20], 80, 8.0)
  end
end

class HulledVehicle
  include Vehicle

  attr_accessor :propeller_count, :hull_count

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    self.propeller_count = num_propellers
    self.hull_count = num_hulls
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end
end

class Catamaran < HulledVehicle
  def initialize
    # num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity
    super(2, 2, 20, 100)
  end
end

class Motorboat < HulledVehicle
  def initialize
    # num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity
    super(1, 1, 15, 100)
  end
end
```

4) The designers of the vehicle management system now want to make an adjustment for how the range of vehicles is calculated. For the seaborne vehicles, due to prevailing ocean currents, they want to add an additional 10km of range even if the vehicle is out of fuel.

Alter the code related to vehicles so that the range for autos and motorcycles is still calculated as before, but for catamarans and motorboats, the range method will return an additional 10km.

Solution:

I would overwrite the `Vehicle` module `range` method in `HulledVehicle`, and use `super` to add 10km to the return of `Vehicle` `range`.

```ruby
module Vehicle
  attr_accessor :speed, :heading
  attr_writer :fuel_efficiency, :fuel_capacity

  def range
    if self.superclass == HulledVehicle 
      @fuel_capacity * @fuel_efficiency + 10
    end
    @fuel_capacity * @fuel_efficiency
  end
end

class WheeledVehicle
  include Vehicle

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures
    super([20,20], 80, 8.0)
  end
end

class HulledVehicle
  include Vehicle

  attr_accessor :propeller_count, :hull_count

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    self.propeller_count = num_propellers
    self.hull_count = num_hulls
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end

  def range
    super + 10
  end
end

class Catamaran < HulledVehicle
  def initialize
    # num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity
    super(2, 2, 20, 100)
  end
end

class Motorboat < HulledVehicle
  def initialize
    # num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity
    super(1, 1, 15, 100)
  end
end
```