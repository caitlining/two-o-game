class Player 

  attr_reader :name, :points, :nick_name
 
   def initialize (name, nick_name, points)
     @name = name
     @nick_name = nick_name
     @points = points
   end
 
   def decrement_points_by(quantity_points)
     @points -= quantity_points
   end
 
   def score_above_zero?
     points > 0
   end
 
 end
 