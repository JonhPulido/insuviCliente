Rails.application.routes.draw do
 
 
  devise_for :people, controllers: {sessions: "sessions",registrations: 'registrations'}



	

  	root 'welcome#index'


       #get'clientes#show'
  		resources :clientes
  		resources :articles
  		resources :demandas
  		resources :creditos
  		resources :mensualidades
  		resources :abonocreditos
  	



  
end
