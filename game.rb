class Game 

  def initialize (user1, user2)
    @player1 = user1
    @player2 = user2
  end

  def run
    puts "----- NEW GAME -----"

    loop do

      question = Question.new
      puts "#{@player1.name}: #{question.get_question}"
      response = $stdin.gets.chomp.to_i

      if (question.is_correct(response))
        puts "#{@player1.name}: YES! You are correct."
        puts "#{@player1.nick_name}: #{@player1.score} vs #{@player2.nick_name}: #{@player2.score}"
        puts "----- NEW TURN -----"
      else 
        puts "#{@player1.name}: Seriously? No!"
        @player1.decrement_points

          if (!@player1.continue_playing?)
            puts "#{@player2.name} wins with a score of #{@player2.score}"
            puts "----- GAME OVER -----"
            puts "Good bye!"
            break
          else 
            puts "#{@player1.nick_name}: #{@player1.score} vs #{@player2.nick_name}: #{@player2.score}"
            puts "----- NEW TURN -----"
          end
      end
      
      question = Question.new
      puts "#{@player2.name}: #{question.get_question}"
      response = $stdin.gets.chomp.to_i
    
      if (question.is_correct(response))
        puts "#{@player2.name}: YES! You are correct."
        puts "#{@player1.nick_name}: #{@player1.score} vs #{@player2.nick_name}: #{@player2.score}"
        puts "----- NEW TURN -----"
      else 
        puts "#{@player2.name}: Seriously? No!"
        @player2.decrement_points

        if (!@player2.continue_playing?)
          puts "#{@player1.name} wins with a score of #{@player1.score}"
          puts "----- GAME OVER -----"
          puts "Good bye!"
          break
        else 
          puts "#{@player1.nick_name}: #{@player1.score} vs #{@player2.nick_name}: #{@player2.score}"
          puts "----- NEW TURN -----"
        end

      end

    end

  end

end