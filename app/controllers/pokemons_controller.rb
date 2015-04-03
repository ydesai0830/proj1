class PokemonsController < ApplicationController

	def capture
		pokemon = Pokemon.find(params[:id])
		pokemon.trainer_id = current_trainer.id
		pokemon.save
		redirect_to root_path
	end

	def damage
		pokemon = Pokemon.find(params[:id])
		pokemon.health = pokemon.health - 10
		if(pokemon.health <= 0)
			current_trainer.pokemon.find(params[:id]).destroy
		end
		pokemon.save
		redirect_to trainer_path(:id => current_trainer.id)

	end

	def new
		@pokemon = Pokemon.new
		render :new

	end

	def create
		name = params[:pokemon][:name]
		pokemon = Pokemon.new
		pokemon.name = name
		pokemon.health = 100
		pokemon.level = 1
		pokemon.trainer_id = current_trainer.id
		if(pokemon.valid?)
			pokemon.save
			redirect_to trainer_path(:id => current_trainer.id)
		else
			flash[:error] = pokemon.errors.full_messages.to_sentence
			new
		end

	end



end
