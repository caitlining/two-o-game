class Question

  def initialize 
    @num1 = (rand * 20).floor
    @num2 = (rand * 20).floor
    @answer = @num1 + @num2
  end

  def output_question
    "What does #{@num1} plus #{@num2} equal?"
  end

  def is_correct?(player_guess)
    player_guess == @answer
  end

end
