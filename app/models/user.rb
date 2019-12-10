class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable,  omniauth_providers: %i(github)

  def self.create_unique_string
    SecureRandom.uuid
  end


  def self.find_for_github_oauth(auth, signed_in_resource=nil)
    user = User.find_by(provider: auth.provider, uid: auth.uid)
    #find_by:複数条件やid以外で検索

    unless user
      user = User.new(provider: auth.provider,
                      uid:      auth.uid,
                      api_token: User.create_unique_string,
                      access_token: auth.credentials.token,
                      name:     auth.info.name,
                      email:    auth.info.email,
                      password: Devise.friendly_token[0, 20]
      )
    end
    user.save
    user
  end
end
