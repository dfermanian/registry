class UserMailer < Facebooker::Rails::Publisher
  
  def profile(user, friend)
      fbml = "Fuck Thomas Jefferson"
      send_as :publish_stream
      from user
      target friend
      message fbml
    end
    
end
