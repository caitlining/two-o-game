class Game 

  def initialize
    @player1 = Player.new('Player 1', 'P1')
    @player2 = Player.new('Player 2', 'P2')
    @game_continue = true
    @player_toggle = true
  end

  def run
    puts "----- NEW GAME -----".magenta

    while @game_continue do     
      puts "#{@player1.nick_name}: #{@player1.score} vs #{@player2.nick_name}: #{@player2.score}"
      puts "----- NEW TURN -----".cyan

      if @player_toggle
        turn(@player1)
        handle_answer(@player1)
      else
        turn(@player2)
        handle_answer(@player2)
      end

    end
  end

  def turn(current_player)  
    question = Question.new
    puts "#{current_player.name}: #{question.get_question}"
    response = gets.chomp.to_i

    if (question.is_correct(response))
      puts "#{current_player.name}: YES! You are correct.".green
    else 
      puts "#{current_player.name}: Seriously? No!".red
      current_player.decrement_points
    end
  end

  def handle_answer(current_player)
   if current_player.continue_playing?
      @player_toggle = !@player_toggle
   else
    end_game
   end
  end

  def end_game
    @game_continue = false
    if @player1.continue_playing?
      winner = @player1
    else 
      winner = @player2
    end

    puts "#{winner.name} wins with a score of #{winner.score}".magenta
    puts "----- GAME OVER -----".red.on_white.bold
    puts "Good bye!".magenta
  end

end