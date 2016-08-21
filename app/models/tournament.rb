class Tournament < ActiveRecord::Base
	has_many :player_infos
	has_many :players, through: :player_infos
	has_many :matches
	has_one :player, :foreign_key => 'winner_id'
end
