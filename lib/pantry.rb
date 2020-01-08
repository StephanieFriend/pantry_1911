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

  def enough_ingredients_for?(recipe)
    required_hash = hash_of_required_ingredients(recipe)
    current_hash = hash_of_current_ingredients()
    if current_hash >= required_hash
      true
    else
      false
    end
    # required_hash.map do |key, values|
    #   require "pry"; binding.pry
    #   if required_hash.key?(key) == current_hash.key?(key)
    #     if current_hash.values.pop <= required_hash.values.pop
    #     # if current_hash.values.pop <= required_hash.values.pop
    #     return false
    #     end
    #   end
    # end
  end

  def hash_of_current_ingredients
    name = stock.map do |key, value|
      key.name
    end
    unit = stock.values
    current = name.zip(unit)

    new_hash = {}

    current.map do |curr|
      new_hash[curr[0]] = curr[1]
    end
    new_hash
  end

  def hash_of_required_ingredients(recipe)
    name = recipe.ingredients_required.map do |key, value|
            key.name
          end
    amount = recipe.ingredients_required.values
    require = name.zip(amount)

    new_hash = {}

    require.map do |req|
      new_hash[req[0]] = req[1]
    end
    new_hash
  end
end
