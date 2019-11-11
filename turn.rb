## ROUGH, not complete

class Turn 

  def play(main_player, next_player)

    question = Question.new
    puts "#{main_player.name}: #{question.get_question}"
    response = $stdin.gets.chomp.to_i

    if (question.is_correct(response))
      puts "#{main_player.name}: YES! You are correct."
      puts "#{main_player.nick_name}: #{main_player.score} vs #{next_player.nick_name}: #{next_player.score}"
      puts "----- NEW TURN -----"
    else 
      puts "#{main_player.name}: Seriously? No!"
      main_player.decrement_points

        if (!main_player.continue_playing?)
          puts "#{next_player.name} wins with a score of #{next_player.score}"
          puts "----- GAME OVER -----"
          puts "Good bye!"
          return false
        else 
          puts "#{main_player.nick_name}: #{main_player.score} vs #{next_player.nick_name}: #{next_player.score}"
          puts "----- NEW TURN -----"
          return true
        end
    end
      
  end

end