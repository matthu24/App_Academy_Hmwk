require_relative 'board'
require_relative 'player'

class Mancala
  def initialize(name1, name2)
    @player1 = Player.new(name1, 1)
    @player2 = Player.new(name2, 2)
    @board = Board.new(name1, name2)
  end

  def play
    puts "Welcome to Mancala"
    @board.render
    current_player = @player1
    until won?
      take_turn(current_player)
      current_player = current_player == @player1 ? @player2 : @player1
    end

    puts "The game is finished! #{winner_message}"
  end

  def take_turn(current_player)
    move_result = :prompt

    #move result can either be switch 
    until move_result == :switch
      #if player ends in own cup
      if move_result == :prompt
        print_indices

        begin
          start_pos = current_player.prompt
          start_pos -= 1 if start_pos <= 6
          @board.valid_move?(start_pos)
        rescue Exception => e
          puts e.message
        retry
        end
        #move_result returns prompt if player ends in own cup, returns the ending_cup_idx if ends in a cup that already has stones in it
        #and returns switch if ends in a cup that is empty
        move_result = @board.make_move(start_pos, current_player.name)
        #else is for ending in a cup that already has stones
      else
        #this is when the player ends the turn in a cup that already has stones in it
        #it takes the ending_cup_idx returned by move_result and makes it the starting position
        move_result = @board.make_move(move_result, current_player.name)
      end
      break if won?
    end
  end

  def won?
     @board.one_side_empty?
  end

  def winner_message
    winner = @board.winner
    if winner == :draw
      "It was a draw!"
    else
      "Congrats, #{winner}!"
    end
  end

  def print_indices
    puts "\nCup indices:"
    puts "12  11  10   9   8   7"
    puts " 1   2   3   4   5   6"
  end
end
