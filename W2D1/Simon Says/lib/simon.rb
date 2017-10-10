class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    round_success_message
    @sequence_length += 1
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
      sleep 1
      system("clear")
      sleep 1
    end
  end

#The goal of require_sequence is to prompt the user to
#repeat back the new sequence that was just shown to them,
# one color at a time. If they give an incorrect color, it
#should immediately set @game_over to be true.
  def require_sequence
    puts "Repeat the sequence that was just shown:"
    @seq.each do |color|
      user_input = gets.chomp
      if color[0] != user_input
        @game_over = true
        break
      end
    end
    
  end

  def add_random_color
    #@sequence_length += 1
    @seq << COLORS.sample
  end

  def round_success_message
    p "Round success!"
  end

  def game_over_message
    p "Game over"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
