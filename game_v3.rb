class Game 

  def initialize (starting_lives = 3)
    @starting_lives = starting_lives
    @player1 = Player.new('Player 1', 'P1', starting_lives)
    @player2 = Player.new('Player 2', 'P2', starting_lives)
    @game_continue = true
    @all_players = [@player1, @player2]
    @active_player = @player1
  end

  def run
    puts "----- NEW GAME -----".magenta

    while @game_continue do

      turn(@active_player)
      puts "#{@player1.short_name}: #{@player1.points}/#{@starting_lives} vs #{@player2.short_name}: #{@player2.points}/#{@starting_lives}"


      if continue_game?
        puts "----- NEW TURN -----".cyan
        switch_active_player_from(@active_player)
      else
        winner = define_winner
        output_winner(winner)
        end_game
      end
    end
  end

  def turn(active_player)
    question = Question.new
    puts "#{active_player.name}: #{question.output_question}"
    player_guess = gets.chomp.to_i

    if (question.is_correct?(player_guess))
      puts "#{active_player.name}: YES! You are correct.".green
    else 
      puts "#{active_player.name}: Seriously? No!".red
      active_player.decrement_points_by(1)
    end
  end

  def continue_game?
    @player1.score_above_zero? && @player2.score_above_zero?
  end

  def switch_active_player_from(player)
    if player == @player1
      @active_player = @player2
    else
      @active_player = @player1
    end
  end

  def define_winner
    @all_players.detect(&:score_above_zero?)
  end

  def output_winner(winner)
    puts "#{winner.name} wins with a score of #{winner.points}/#{@starting_lives}".magenta
  end

  def end_game
    @game_continue = false
    puts "----- GAME OVER -----".red.on_white.bold
    puts "Good bye!".magenta
  end

end