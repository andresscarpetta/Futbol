class Player < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :player_infos
	has_many :tournaments, through: :player_infos
	has_many :first_player, :class_name => 'Match', :foreign_key => 'first_player_id'
	has_many :second_player, :class_name => 'Match', :foreign_key => 'second_player_id'
  	belongs_to :tournament, :foreign_key => 'winner_id'
end
