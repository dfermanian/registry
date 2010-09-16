class UserMailer < Facebooker::Rails::Publisher
  
  def profile(from_user, to_user,message_fbml)
      send_as :publish_stream
      from from_user
      target to_user
      message message_fbml
      action_links [action_link("Make Donations!", "http://apps.facebook.com/ptndlol")]
    end
    

    
end
