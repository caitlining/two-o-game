#ROUGH, not complete

class Game 

  def initialize (user1, user2)
    @player1 = user1
    @player2 = user2
  end

  def run
    turn = Turn.new
    
    loop do

    if @player1.continue_playing?
      if (!turn.play(@player1, @player2))
        break
      end
    end

    if (@player2.continue_playing?)
      if (!turn.play(@player2, @player1))
        break
      end
    end

    end

  end

end