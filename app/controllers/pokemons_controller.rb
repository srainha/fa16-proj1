class PokemonsController < ApplicationController

  def capture
  	Pokemon.find_by(id: params[:id]).update_attribute(:trainer, current_trainer)
	redirect_to :root
  end

  def damage
  	pok = params[:pok]
  	curr = Pokemon.find_by(name: pok[0], level: pok[1], health: pok[2])
  	hel = curr[:health]
  	curr.update_attribute(:health, (hel - 10))
  	if (hel - 10) <= 0
  		curr.destroy
  	end
	redirect_to(:back)
  end

  def new
    @user = current_trainer
    @new_pokemon = Pokemon.new
    p "IN NEW"
    p flash[:error]
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
    p " AQUI"
    p @pokemon.errors.full_messages.to_sentence
    p flash[:error]
    flash.keep
    return new
  end

end
