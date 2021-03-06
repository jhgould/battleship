require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require "pry"

class CellTest < Minitest::Test

  def test_it_exists
    cell = Cell.new("B2")
    assert_instance_of Cell, cell
  end

  def test_it_has_attributes
    cell = Cell.new("B2")
    assert_equal "B2", cell.coordinate
  end

  def test_it_can_detect_empty_cell
    cell = Cell.new("B4")
    assert_equal true, cell.empty?
  end

  def test_it_can_detect_no_ship_on_empty_cell
    cell = Cell.new("B2")
    assert_nil cell.ship
  end

  def test_it_can_place_ship_on_cell
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    assert_equal false, cell.empty?
    assert_equal cruiser, cell.ship
  end

  def test_it_can_fire_upon_ship
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    cell.fire_upon

    assert_equal true, cell.fired_upon?
    assert_equal 2, cruiser.health
  end

  def test_it_can_render_empty_hit_sunk
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    assert_equal ".", cell.render
    cell.fire_upon
    assert_equal "H", cell.render
    cell.fire_upon
    cell.fire_upon
    assert_equal "X", cell.render
  end

  def test_it_can_render_empty_hit_sunk
    cell1 = Cell.new("B4")
    cell2 = Cell.new("A1")
    cruiser = Ship.new("Cruiser", 3)
    cell1.place_ship(cruiser)
    cell1.fire_upon

    assert_equal "H", cell1.render
    cell2.fire_upon
    assert_equal "M", cell2.render
  end

  def test_it_can_render_miss
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    assert_equal ".", cell.render
    cell.fire_upon
    assert_equal "H", cell.render
    cell.fire_upon
    cell.fire_upon
    assert_equal "X", cell.render
  end

  def test_it_can_render_with_optional_argument
    cell = Cell.new("B2")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    assert_equal "S", cell.render(true)
  end
end
