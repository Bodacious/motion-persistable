describe "User" do
  before do
    @user = User.new('bodacious')
  end

  after do
    # Clear out the cache
    domainName = NSBundle.mainBundle.bundleIdentifier
    NSUserDefaults.standardUserDefaults.removePersistentDomainForName(domainName)
  end
  
  describe "email" do

    it "is persisted between instances" do
      @user.email = "bodacious@katanacode.com"
      @user       = User.new("bodacious")
      @user.email.should == "bodacious@katanacode.com"
    end
    
    it "defaults to an empty string" do
      @user = User.new("other-user")
      @user.email.should == ""
    end  
    
  end

  describe "age" do

    it "defaults to 16" do
      @user = User.new("other-user")
      @user.age.should == 16
    end  

    it "is persisted between instances" do
      @user.age = 28
      @user     = User.new("bodacious")
      @user.age.should == 28
    end
    
  end
  
  describe "location" do

    it "defaults to nil" do
      @user = User.new("other-user")
      @user.location.should == nil
    end  

    it "is persisted between instances" do
      @user.location = "Edinburgh"
      @user     = User.new("bodacious")
      @user.location.should == "Edinburgh"
    end
    
  end
  
  describe "last_sign_in" do
  
    it "defaults to nil" do
      @user = User.new("other-user")
      @user.last_sign_in.should == nil
    end 
    
    it "is persisted between instances" do
      @user.last_sign_in = Time.now
      @user     = User.new("bodacious")
      @user.last_sign_in.should != nil
    end 
    
    it "calls the callback block when set" do
      User.last_signed_in_user = nil
      time = Time.now
      @user.last_sign_in = time
      App::Persistence['last_sign_in'].should == time
    end
    
  end
  
end