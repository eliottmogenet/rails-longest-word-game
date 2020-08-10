Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'new', to: 'games#new'
  post 'score', to: 'games#score'
end

#CODER EN SILO
#1 on créé une route (get ou post)
#2 cette rooteredige vers un controller qu'il faut créer / avec méthode --> @instance
#3 la root redirige vers la view : réutiliser avec @

#Les conventions
# un index : list d'appartements
# une show : afficher un appartement en particulier

#pour retrouver une instance par son id :@flats.find()
