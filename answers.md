# Q0: Why is this error being thrown?
In routes.rb, we set root to home#index.
Then in the Home_Controller.rb#index we make reference to Pokemon.where, but since no model or controller exist for Pokemon, this throws an error.

# Q1: How are the random Pokemon appearing? What is the common factor between all the possible Pokemon that appear? 
In our seeds.rb file, we generate 4 Pokemon each with level between 1 and 20. Then, in home_controller, we sample from these Pokemon, and that allows us to randomly display one of them on the home page.

# Question 2a: What does the following line do "<%= button_to "Throw a Pokeball!", capture_path(id: @pokemon), :class => "button medium", :method => :patch %>"? Be specific about what "capture_path(id: @pokemon)" is doing. If you're having trouble, look at the Help section in the README.

# Question 3: What would you name your own Pokemon?
I would catch a Squirtle and evolve him to Blastoise and name him Fatso

# Question 4: What did you pass into the redirect_to? If it is a path, what did that path need? If it is not a path, why is it okay not to have a path here?
redirect_to(:back)
It takes you back to the current page as long as no refferer or session authentications are required.

# Question 5: Explain how putting this line "flash[:error] = @pokemon.errors.full_messages.to_sentence" shows error messages on your form.

The right side of that statement is just a string explaining the error and it was produced when we failed to save @pokemon.
The left side is a hash that the view has access to and its a special ruby thing that shows the error message in a red bar at the top of the page.

# Give us feedback on the project and decal below!

# Extra credit: Link your Heroku deployed app



https://github.com/srainha/fa16-proj1/tree/sr-proj1