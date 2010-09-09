class UserMailer < Facebooker::Rails::Publisher
  
  def profile(user)
      fbml = "This is some test FBML that will be inserted into a user is profile."
      send_as :publish_stream
      from user
      target user
      message fbml
    end
    
end
