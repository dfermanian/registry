class UserMailer < Facebooker::Rails::Publisher
  
  def profile(from_user, to_user,message_fbml)
      send_as :publish_stream
      from from_user
      target to_user
      message message_fbml
    end
    

    
end
