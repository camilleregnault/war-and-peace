class FightsController < ApplicationController
  def index
    @candidates = Candidate.all
  end

  def show
  end

  def new
    @fight = Fight.new
  end

  def create
    @fight = Fight.new(fight_params)
    @fight[:winner_id] = params['fight']['candidate_a']
    @fight[:looser_id] = params['fight']['candidate_b']
    if @fight.save
      redirect_to fight_path(@fight)
    else
      render :new
    end
  end

  private

  def fight_result
  
  end

  def fight_params
    params.require(:fight).permit(:winner_id, :loser_id)
  end
end
