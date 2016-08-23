class User < ActiveRecord::Base

  def self.create_with_omniauth(auth)
    create! do |u|
      u.provider = auth["provider"]
      u.uid = auth["uid"]
      u.first_name = auth["info"]["first_name"]
      u.last_name = auth["info"]["last_name"]
    end
  end

end
