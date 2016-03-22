## Exercises Medium 2

#### Q 1

Hashes are commonly found to be more complex than the simple one we saw earlier:

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
```

It is often the case that each key points to another hash instead of a single value:

```ruby
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}
```

Figure out the total age of just the male members of the family.


#### Answer

```ruby
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}

male_age = 0
munsters.each_key do |name|
  if munsters[name]["gender"].start_with?("m") # why must name of hsh be included? it isn't in sample answer for what looks like a similar situation?
    male_age = male_age + munsters[name]["age"]
  end
end

p male_age
```