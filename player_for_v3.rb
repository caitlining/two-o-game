class Player 

  attr_reader :name, :points, :short_name
 
   def initialize (name, short_name, points)
     @name = name
     @short_name = short_name
     @points = points
   end
 
   def decrement_points_by(quantity_points)
     @points -= quantity_points
   end
 
   def score_above_zero?
     points > 0
   end
 
 end
 