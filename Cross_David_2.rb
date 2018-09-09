# Part 2

def hello(name)
  # YOUR CODE HERE
  return "Hello, " + name
end

def starts_with_consonant? s
  # YOUR CODE HERE
  if (/^[^aeiouAEIOU\W]/i.match(s))
    return true
  else
    return false
  end
end

def binary_multiple_of_4? s
  # YOUR CODE HERE
  if (/^[10]*[0]*0$/i.match(s))
    return true
  else
    return false
  end
end