require_relative 'ship'

class Board

COORDS = [:A1, :A2, :A3, :A4, :A5, :A6, :A7, :A8, :A9, :A10,
          :B1, :B2, :B3, :B4, :B5, :B6, :B7, :B8, :B9, :B10,
          :C1, :C2, :C3, :C4, :C5, :C6, :C7, :C8, :C9, :C10,
          :D1, :D2, :D3, :D4, :D5, :D6, :D7, :D8, :D9, :D10,
          :E1, :E2, :E3, :E4, :E5, :E6, :E7, :E8, :E9, :E10,
          :F1, :F2, :F3, :F4, :F5, :F6, :F7, :F8, :F9, :F10,
          :G1, :G2, :G3, :G4, :G5, :G6, :G7, :G8, :G9, :G10,
          :H1, :H2, :H3, :H4, :H5, :H6, :H7, :H8, :H9, :H10,
          :I1, :I2, :I3, :I4, :I5, :I6, :I7, :I8, :I9, :I10,
          :J1, :J2, :J3, :J4, :J5, :J6, :J7, :J8, :J9, :J10]

  attr_reader :board, :grid, :coords, :ships

  def initialize
    @board = []
    @coords = []
    @ships = []

  end

  def accept_ship ship, positions
    while positions.length > 0
      accept(ship, positions[0])
      positions = positions[1..-1]
    end
  end

  def accept ship, position
    fail 'location occupied' if occupied?(position)
    fail 'invalid location' if invalid?(position)
    ## repeat checks for entire length of ship
    board << {coords: position, ships: ship}
    coords << [position]
    ships << [ship]
  end

  def report position
    status = board.select{ |x| x[:coords] == position }
    status == [] ? "Miss" : "Hit"
  end

  def occupied? position
    board.select{ |x| x[:coords] == position } != []
  end

  def invalid? position
    !COORDS.include?(position)
  end

end
# player places ship on board
# def place ship, position
#   ship.size.times do
#     board << {coords: position, ship: ship}
#     position = position.next
#   end
#     @position = []
# end

# def find_next_coordinate coordinate, direction
#   next_coordinate = direction == :horizontal ? next_coordinate.next :
# end


#"place ship at A1, A2" => ship = [A1, A2]
#{}"place ship at A1, A2" => board << {A1. ship}, {A2,ship}
