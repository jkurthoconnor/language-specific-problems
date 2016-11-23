Exercises from Launch School course 170
[URL Components](https://launchschool.com/lessons/1ba34626/assignments/8eae723c)

1. Given the following URL

```ruby
 https://amazon.com/Double-Stainless-Commercial-Refrigerator/B60HON32?ie=UTF8&qid=142952676&sr=93&keywords=commercial+fridge
```
a. identify the host
  - `amazon.com`

b. identify the names of the query parameters
  - 'ie', 'qid', 'sr', 'keywords'

c. identify the values of the query parameters
  - 'UTF8', '142952676', '93', 'commercial+fridge'

d. identify the protocol
  - https

e. identify the path
  - '/Double-Stainless-Commercial-Refrigerator/B60HON32'

f. identify the port
  - inferred that it is 443, but it is not stated
  
2. Add the port `3000` to the following URL

```ruby
http://amazon.com/products/B60HON32?qid=142952676&sr=93
```

```ruby
http://amazon.com:3000/products/B60HON32?qid=142952676&sr=93
```

3. Given the following URL:

```ruby
http://localhost:4567/todos/15
```

a. identify the query parameters
  - there are none

b. identify the protocol
  - http

c. identify the path
  - /todos/15

d. identify the host
  - localhost

e. identify the port
  - 4567

4. What are two different ways to encode a space in a query parameter? 

- `%20` and `+`

5. What character indicates the beginning of a URL's query parameters?

- `?`

6. What character is used between the name and value of a query parameter?

  - `=`
  
7. What character is used between multiple query parameters?

  - `&`

