class TournamentsController < ApplicationController

  def show
    @tournaments = Tournament.all
  end

  def init
    @tournament = Tournament.find(params[:id])
  end

  def create
    if(Tournament.find_by(name: params[:name]) == nil)
      t = Tournament.new
      t.name = params[:name]
      t.minPlayers = params[:min]
      t.status = false
      t.save
      redirect_to '/', notice: "Torneo Creado"
    else
      redirect_to '/', alert: "Error, Torneo ya existente"
    end
  end

end
