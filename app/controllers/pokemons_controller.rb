class PokemonsController < ApplicationController

  def capture
  	Pokemon.find_by(id: params[:id]).update_attribute(:trainer, current_trainer)
	  redirect_to :root
  end

  def damage
  	pokemon = params[:pokemon]
  	current_pokemon = Pokemon.find_by(name: pokemon[0], level: pokemon[1], health: pokemon[2])
  	health = current_pokemon[:health]
  	current_pokemon.update_attribute(:health, (health - 10))
  	if (health - 10) <= 0
  		current_pokemon.destroy
  	end
	  redirect_to(:back)
  end

  def new
    @new_pokemon = Pokemon.new
    render 'new'
  end

  def create
    @pokemon = Pokemon.new(name: (params[:pokemon])[:name], level: 1, health: 100, trainer: current_trainer)
    params[:id] = current_trainer[:id]
    if @pokemon.save
      redirect_to current_path
      return
    end
    flash[:error] = @pokemon.errors.full_messages.to_sentence
    flash.keep
    return new
  end
end
