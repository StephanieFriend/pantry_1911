class Pantry

  attr_reader :stock

  def initialize
    @stock = {}
  end

  def stock_check(ingredient)
    check = @stock[ingredient]
    if check == nil
      return 0
    else
      check
    end
  end

  def restock(ingredient, amount)
    if @stock.key?(ingredient)
      @stock[ingredient] = @stock[ingredient] + amount
    else
      @stock[ingredient] = amount
    end
  end
end
