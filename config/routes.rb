ActionController::Routing::Routes.draw do |map|
  map.resources :hellos
  map.resources :donations, :new => { :create_express => :get }

   map.resources :brides

   map.resources :gifts

   map.root :controller => :brides, :action => :index
  # Tell Rails to make invitations into a resource
  map.resources :invitations
  # Use our new method as the default page
#  map.root :controller=>"invitations", :action=>"new"
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
