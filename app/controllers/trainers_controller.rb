class TrainersController < ApplicationController
  before_filter :authenticate_trainer!

  def index
    @trainers = Trainer.all
  end

  def show
    @trainer = Trainer.find(params[:id])
    @pokemons = Pokemon.where(trainer: @trainer).pluck(:name, :level, :health)
  end

  def current
  	@trainer = current_trainer
  	@pokemons = Pokemon.where(trainer: @trainer).pluck(:name, :level, :health)
  	render 'show'
  end

end
