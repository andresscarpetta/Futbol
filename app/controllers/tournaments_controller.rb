class TournamentsController < ApplicationController

  def join
    @tournament = Tournament.find(params[:id])
  end

  def show
    @tournaments = Tournament.all
  end

  def init
    @tournament = Tournament.find(params[:id])
    @user = current_player
  end

  def start
    tournament = Tournament.find(params[:id])
    players = params[:players]
    if(players.size >= tournament.minPlayers)
      for i in 0..tournament.players.size
        for j in i+1..tournament.players.size-1
          m = Match.new
          m.status = "Not Played"
          m.first_player = tournament.players[i]
          m.second_player = tournament.players[j]
          m.tournament = tournament
          m.save
        end
      end
      respond_to do |format|
        format.json do
          render json: {
            response: "success"
          }.to_json
        end
      end
    else
      respond_to do |format|
        format.json do
          render json: {
            response: "error",
            reason: "No hay suficientes jugadores"
          }.to_json
        end
      end
    end
  end

  def play
    @tournament = Tournament.find(params[:id])
    @matches = []
    Match.all.each do |match|
      if match.status == "Not Played" && match.tournament == @tournament
        matrix = [ [ match.first_player.username, PlayerInfo.find_by(player_id: match.first_player.id).team ], [ match.second_player.username, PlayerInfo.find_by(player_id: match.second_player.id).team ] ]
        @matches.push(matrix)
      end
    end
    @tournament.status = "Started"
    @tournament.save
    @players_info = PlayerInfo.where(tournament_id: @tournament.id).order(currentPoints: :desc)
    if( @matches.size < 1 )
      redirect_to tournament_final_match_path(params[:id])
    end
  end

  def create
    if(Tournament.find_by(name: params[:name]) == nil)
      t = Tournament.new
      t.name = params[:name]
      t.minPlayers = params[:min]
      t.status = "Created"
      t.save
      redirect_to tournament_owner_join_path(t.id), notice: "Torneo Creado"
    else
      redirect_to tournament_new_path, alert: "Error, Torneo ya existente"
    end
  end

  def match_finished
    first_player = Player.find_by(username: params[:first_player_name])
    second_player = Player.find_by(username: params[:second_player_name])
    first_player_info = PlayerInfo.find_by(player_id: first_player.id)
    second_player_info = PlayerInfo.find_by(player_id: second_player.id)
    match = Match.find_by(first_player_id: first_player.id, second_player_id: second_player.id, tournament_id: params[:id])
    if(params[:first_player] > params[:second_player])
      match.status = "Played"
      match.save
      first_player_info.currentPoints = first_player_info.currentPoints + 3
      first_player_info.save
      redirect_to tournament_play_path(params[:id]), notice: "Ganador: " + first_player.username
    elsif(params[:second_player] > params[:first_player])
      match.status = "Played"
      match.save
      second_player_info.currentPoints = second_player_info.currentPoints + 3
      second_player_info.save
      redirect_to tournament_play_path(params[:id]), notice: "Ganador: " + second_player.username
    elsif(params[:first_player] == params[:second_player])
      match.status = "Played"
      match.save
      first_player_info.currentPoints = first_player_info.currentPoints + 1
      second_player_info.currentPoints = second_player_info.currentPoints + 1
      first_player_info.save
      second_player_info.save
      redirect_to tournament_play_path(params[:id]), notice: "Empate"
    end
  end

  def finish
    @tournament = Tournament.find(params[:id])
    @players_info = PlayerInfo.where(tournament_id: @tournament.id).order(currentPoints: :desc)
    @tournament.winner_id = Player.find_by(username: params[:winner_name]).id
    @winner = params[:winner_name]
    @tournament.status = "Finished"
    @tournament.save
  end

  def final_match
    first_player = Player.find_by(username: params[:first_finalist_name])
    second_player = Player.find_by(username: params[:second_finalist_name])
    first_player_info = PlayerInfo.find_by(player_id: first_player.id)
    second_player_info = PlayerInfo.find_by(player_id: second_player.id)
    if(params[:second_finalist_score] > params[:first_finalist_score])
      redirect_to tournament_summary_path(params[:id], winner_name: second_player.username)
    end
    if(params[:first_finalist_score] > params[:second_finalist_score])
      redirect_to tournament_summary_path(params[:id], winner_name: first_player.username)
    end
    if(params[:first_finalist_score] == params[:second_finalist_score])
      redirect_to tournament_final_match_path(params[:id])
    end
  end

  def final
    @tournament = Tournament.find(params[:id])
    @players_info = PlayerInfo.where(tournament_id: @tournament.id).order(currentPoints: :desc)
  end

  def destroy
    tournament = Tournament.find(params[:id])
    tournament.save
    redirect_to tournament_index_path, notice: "Torneo Terminado"
  end

  def join_player
    current_player.player_infos.build(team: params[:team], currentPoints: 0, tournament_id: params[:id])
    current_player.save
    redirect_to tournament_joined_path(params[:id])
  end

  def owner_join
    @tournament = Tournament.find(params[:id])    
  end

  def join_owner
    current_player.player_infos.build(team: params[:team], currentPoints: 0, tournament_id: params[:id])
    current_player.save
    redirect_to tournament_init_path(params[:id])
  end

end
