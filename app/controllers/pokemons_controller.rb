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

end
