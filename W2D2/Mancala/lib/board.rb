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
    raise "Invalid starting cup" if start_pos > 12 || start_pos < 0
    raise "Invalid starting cup" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []

    next_cup_pos = start_pos
    until stones.empty?
      next_cup_pos +=1
      next_cup_pos = next_cup_pos % 14
      if next_cup_pos == 13
        @cups[next_cup_pos] << stones.pop if @name2 == current_player_name
      elsif next_cup_pos == 6
        @cups[next_cup_pos] << stones.pop if @name1 == current_player_name
      else
        @cups[next_cup_pos] << stones.pop
      end
    end
    render
    next_turn(next_cup_pos)
  end

  def next_turn(next_cup)
    # helper method to determine what #make_move returns
    if next_cup == 6 || next_cup == 13
      return :prompt
    elsif @cups[next_cup].count == 1
      return :switch
    else
      return next_cup
    end
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
