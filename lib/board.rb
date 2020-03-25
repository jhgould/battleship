require 'pry';

class Board
  attr_reader :cells

  def initialize
    @cells = cells
  end

  def cells
    cells = {}

    x_axis = ("A".."D").to_a
    y_axis = ("1".."4").to_a

    keys = []
    x_axis.each do |x|
      y_axis.each do |y|
        keys << (x + y)
      end
    end

    values = []
    keys.each do |key|
      values << Cell.new(key)

    end

    keys.each do |key|
      values.each do |value|
        cells[key] = value
      end
    end
    cells
  end

  def valid_coordinate?(cell)
    if cells.include?(cell)
      true
    else
      false
    end
  end


  def valid_placement?(ship, cells)
    if ship.length == cells.length && cells.empty? == true
      true
    else
      false
    end

  end




end