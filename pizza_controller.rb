require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( './models/pizza_order' )
also_reload( './models/*' )

#index route
get("/pizza_orders") do
  @pizzas = PizzaOrder.all()
  #method defined last week in the project
  erb(:index)
end

get("/pizza_orders/new") do
  erb(:new)
end

get("/pizza_orders/:id/edit") do
  id = params[:id].to_i()
  @pizza = PizzaOrder.find(id)
  erb(:edit)
end

post("/pizza_order/:id") do
  @pizza = PizzaOrder.new(params)
  @pizza.update()
  erb(:update)

end



#show route
get("/pizza_orders/:id") do
  id = params[:id].to_i()
  @pizza = PizzaOrder.find(id)
  #that method has been defined earlier in the project
  erb(:show)
end

post('/pizza_orders/:id/delete') do
  id = params[:id].to_i()
  @pizza = PizzaOrder.find(id)
  @pizza.delete()
  erb(:delete)
end

post('/pizza_orders') do
  @pizza = PizzaOrder.new(params)
  @pizza.save()
  erb(:create)
end
