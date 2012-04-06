Faq::Engine.routes.draw do

	namespace :admin do
		resources :faqs do
      post :sort, :on => :collection
		end
	end

	resources :faqs
end
