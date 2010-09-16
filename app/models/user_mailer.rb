class UserMailer < Facebooker::Rails::Publisher
  
  def profile(from_user, to_user,message_fbml)
      send_as :publish_stream
      from from_user
      target to_user
      message message_fbml
      action_link {:text=>"Add the app now!", :href => "http://www.apps.facebook.com/ptndlol"}
    end
    

    
end
