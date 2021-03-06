class PokemonsController < ApplicationController
    def index 
        pokemons = Pokemon.all
        render json: pokemons
    end 

    def show 
        pokemon = Pokemon.find(params[:id])
        render json: pokemon
    end 

    def create 
        name = Faker::Name.first_name
        species = Faker::Games::Pokemon.name
        trainer = Trainer.find(params[:trainer_id])
        pokemon = trainer.pokemons.build(nickname: name, species: species)
        if pokemon.save
            render json: pokemon
        else 
            render json: "you are not very good at this, are you?"
        end 
    end 

    def destroy 
        pokemon = Pokemon.find(params[:id])
        pokemon.destroy 
    end 
end
