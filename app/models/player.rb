class Player < ActiveRecord::Base
	has_many :player_infos
	has_many :tournaments, through: :player_infos
end
