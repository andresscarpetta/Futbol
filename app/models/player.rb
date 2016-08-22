class Player < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 	devise :database_authenticatable, :registerable,
    	   :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
	has_many :player_infos
	has_many :tournaments, through: :player_infos
	has_many :first_player, :class_name => 'Match', :foreign_key => 'first_player_id'
	has_many :second_player, :class_name => 'Match', :foreign_key => 'second_player_id'
  	belongs_to :tournament, :foreign_key => 'winner_id'
  	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
 	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

 	def self.from_omniauth(auth)
		where(provider: auth.provider, uid: auth.uid).first_or_create do |player|
		    player.email = auth.info.email
		    player.password = Devise.friendly_token[0,20]
		    player.username = auth.info.name   # assuming the user model has a name
		    player.avatar = auth.info.image # assuming the user model has an image
		end
	end

	def self.new_with_session(params, session)
	    super.tap do |player|
		    if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
		        player.email = data["email"] if player.email.blank?
		    end
	    end
	  end
end
