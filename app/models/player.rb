class Player < ActiveRecord::Base
	has_many :player_infos
	has_many :tournaments, through: :player_infos
	has_many :first_player, :class_name => 'Match', :foreign_key => 'first_player_id'
	has_many :second_player, :class_name => 'Match', :foreign_key => 'second_player_id'
end
