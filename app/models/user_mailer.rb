class UserMailer < Facebooker::Rails::Publisher
  
  def profile(user)
      fbml = "Fuck Thomas Jefferson"
      send_as :publish_stream
      from user
      target user
      message fbml
    end
    
end
