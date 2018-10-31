class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, i|
      next if i == 6 || i == 13
        4.times do
          cup << :stone
        end
      end
    # end
    # @cups[6] = []
    # @cups[13] = []
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 12
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
      stones = @cups[start_pos]
      @cups[start_pos] = []

      cup_i = start_pos
      until stones.empty?
        cup_i += 1
        cup_i = 0 if cup_i > 13

        if cup_i == 6
          @cups[6] << stones.pop if current_player_name == @name1
        elsif cup_i == 13
          @cups[13] << stones.pop if current_player_name == @name2
        else
          @cups[cup_i] << stones.pop
        end
      end

      render
      next_turn(cup_i)
  end

end
