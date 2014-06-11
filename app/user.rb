class User
  
  attr_accessor :username
  
  include Motion::Persistable
  
  attr_persisted :email, ''
  
  attr_persisted :age, 16
  
  attr_persisted :location
  
  attr_persisted :last_sign_in, nil do |value|
    App::Persistence['last_sign_in'] = value
  end
  
  class << self
    include Motion::Persistable
    attr_persisted :last_signed_in_user
  end
  
  def initialize(username)
    self.username = username 
  end
  
  def name
    username
  end
  
end