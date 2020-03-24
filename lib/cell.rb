class Cell

  attr_reader :coordinate, :empty, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @empty = true
  end

  def ship
    if @empty == true
      nil
    else
      ship
    end
  end

  def empty?
    @empty
  end

  def place_ship(ship)
    @empty = false
    ship = ship
  end

  def fired_upon?
    false
  end
    # not yet sure that the fire_upon method can change the value or if that requires creating an instance variable

  def fire_upon
    fired_upon? == true
    if ship
      ship.health -= 1
      # will we need to add to this method for sunken ship?
      # can use ship.hit here?
    end
  end

  def render
    if fired_upon == false
      "."
    elsif fired_upon == true && ship.hit == false
      "M"
    elsif fired_upon == true && ship.hit == true
      "H"
    elsif fired_upon == true && ship.sunk? == true
      "X"
    end
    # it takes an optional boolean argument but I don't understand why
    # this method displays whether the cell has been fired upon, whether it contains a ship, etc.
    # it pull p to the screen based on what criteria it meets
  end
end
