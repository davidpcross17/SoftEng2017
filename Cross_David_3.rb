# Part 3

class BookInStock
# YOUR CODE HERE
  def initialize(new_isbn,new_price)
    if(new_isbn == "" || new_price <= 0)
      raise ArgumentError.new("Invalid Input")
    end
    @isbn = new_isbn
    @price = new_price
  end
  def isbn
    @isbn
  end
  def isbn=(new_isbn)
    @isbn = new_isbn
  end
  def price
    @price
  end
  def price=(new_price)
    @price = new_price
  end
  
  def price_as_string
    ret_string = "$%02.2f" %[@price]
    return ret_string
  end
end