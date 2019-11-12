class Player 

 attr_reader :name, :points, :nick_name

  def initialize (name, nick_name)
    @name = name
    @nick_name = nick_name
    @points = 3
  end

  def decrement_points
    @points -= 1
  end

  def continue_playing?
    points > 0
  end

  def score
    "#{points} / 3"
  end
end
