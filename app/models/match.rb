class Match < ActiveRecord::Base
  belongs_to :first_player, :class_name => "Player"
  belongs_to :second_player, :class_name => "Player"
  belongs_to :tournament
end
