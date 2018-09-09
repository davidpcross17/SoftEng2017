# Part 1

def sum arr
  # YOUR CODE HERE
  return arr.inject(0, :+)
end

def max_2_sum arr
  # YOUR CODE HERE
  tempArr = arr.max(2)
  return tempArr.inject(0, :+)
end

def sum_to_n? arr, n
  # YOUR CODE HERE
  if(arr.combination(2).find{|a,b|a+b==n})
    return true
  else
    return false
  end
end