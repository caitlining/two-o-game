class Question

  attr_accessor :num1, :num2, :answer

  def initialize 
    @num1 = (rand * 20).floor
    @num2 = (rand * 20).floor
    @answer = @num1 + @num2
  end

  def get_question
    "What does #{num1} plus #{num2} equal?"
  end

  def is_correct(response)
    response == self.answer
  end

end
