class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = []
    14.times {@cups << []}
    place_stones

  end

  def place_stones
    @cups.each_index do |idx|
      @cups[idx] += [:stone,:stone,:stone,:stone] unless idx == 6 || idx == 13
    end
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' if start_pos >= 13 || start_pos <= 0
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []
    next_cup = start_pos
    until stones.empty?
      next_cup+=1
      if next_cup == 14
        next_cup = 0
      end
      @cups[next_cup] << stones.pop unless next_cup == 13 && current_player_name == @name1 || next_cup == 6 && current_player_name == @name2

    end



    render
    next_turn(next_cup)
  end

#logic for returning prompt,switch or end cup idx
  def next_turn(next_cup)
    if next_cup == 13 || next_cup == 6
      return :prompt
    elsif @cups[next_cup].length == 1
      return :switch

    elsif @cups[next_cup].length > 1
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
    @cups[0..5].all?{|cup| cup.empty?} || @cups[7..12].all?{|cup| cup.empty?}
  end

  def winner
        return @name1 if @cups[6].length > @cups[13].length
        return @name2 if @cups[6].length < @cups[13].length
        return :draw
  end
end
