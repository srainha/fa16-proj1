class PokemonsController < ApplicationController

  def capture
  	Pokemon.find_by(id: params[:id]).update_attribute(:trainer, current_trainer)
	redirect_to :root
  end

end
