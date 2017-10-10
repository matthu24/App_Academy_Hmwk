class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14)
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup,index|
      if index == 6 || index == 13
        @cups[index] = []
      else
        @cups[index] = [:stone, :stone, :stone, :stone]
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos > 13 || start_pos < 1
  end

  #returns either :prompt when end in own cup
  #:ending_cup_idx when in a cup that already has stones in it
  #:switch when in a cup that is empty
  def make_move(start_pos, current_player_name)

    #how many times we need to distribute
    number_of_stones = @cups[start_pos].length
    @cups[start_pos] = []

    count = 1
    until count > number_of_stones
      next_cup = start_pos + count
      #handles wrapping around
      next_cup = next_cup % 14
      #distributes stones
      @cups[next_cup] << :stone
      #when landing on opponent's cup, skip and add to number_of_stones so you put one more stone that you saved when skipping the opponent's cup
      if (next_cup == 6 && current_player_name == @name2) || (next_cup == 13 && current_player_name == @name1)
        number_of_stones += 1
        @cups[next_cup].pop
      end

      count+=1
    end

    #name 1's cup is 6
    #name 2's cup is 13
    render
    next_turn(next_cup)
    return :prompt if (next_cup == 6 && current_player_name == @name1) || (next_cup == 13 && current_player_name == @name2)
    return :switch if @cups[next_cup].length == 1
    return next_cup if @cups[next_cup].length > 1
  end

  def next_turn(next_cup)
    # helper method to determine what #make_move returns
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all?{|el| el.empty?} || @cups[7..12].all?{|el| el.empty?}
  end

  def winner
    #if one_side_empty?
      return :draw if @cups[6].length == @cups[13].length
      return (@cups[6].length > @cups[13].length) ?  @name1 :  @name2
    #end
  end
end
