class Cell

  attr_reader :coordinate, :ship, :empty

  def initialize(coordinate)
    @coordinate = coordinate
    @empty = false
    @ship = nil
    @fired_upon = false
  end

  def empty?
    @empty
  end

  def place_ship(ship)
    @empty = false
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
    if @ship == ship
      ship.hit
    end
  end

  def render(show = false)
    if @fired_upon == false
      if show == true && empty? == false
        "S"
      else
        "."
      end
    elsif @fired_upon == true
      if ship.health == ship.length
        "M"
      elsif ship.length > ship.health && ship.sunk? == false
        "H"
      elsif ship.sunk? == true
        "X"
      end
    end
    #can refactor with guard statements!
    #or more complex condition statements
  end
end
