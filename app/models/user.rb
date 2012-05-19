class User < ActiveRecord::Base
  validates :name, presence: true
  validates :github_uid, presence: true, uniqueness: true

  def self.create_with_omniauth(auth)
    create! do |user|
      user.github_uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
      end
    end
  end

end

