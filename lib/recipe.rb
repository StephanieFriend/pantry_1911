class Recipe

  attr_reader :name, :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = {}
  end

  def add_ingredient(ingredient, amount)
    if @ingredients_required.key?(ingredient)
      @ingredients_required[ingredient] = @ingredients_required[ingredient] + amount
    else
      @ingredients_required[ingredient] = amount
    end
  end

  def amount_required(ingredient)
    @ingredients_required[ingredient]
  end

  def ingredients
    ingredient = []
    ingredient << @ingredients_required.keys
    ingredient.flatten
  end

  def total_calories
    cal = @ingredients_required.map do |key, value|
      key.calories
    end
    unit = @ingredients_required.values

    total = cal.zip(unit).map{ |calories, unit| calories * unit }
    total.sum
  end
end
