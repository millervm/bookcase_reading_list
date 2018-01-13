class User < ActiveRecord::Base
  has_many :books
  has_secure_password

  def self.current_user(session)
    User.find(session[:user_id])
  end

  def self.is_logged_in?(session)
    !!session[:user_id]
  end

  def slug
    self.username.split(" ").collect {|word| word.downcase}.join("-")
  end

  def self.find_by_slug(slug)
    self.where("lower(username) = ?", slug.split("-").join(" ").downcase).first
  end

end
