class FightsController < ApplicationController
  def index
    @candidates = Candidate.all
  end

  def show
    @fight_result = Fight.last
    @winner = Candidate.find(@fight_result[:winner_id])
    @loser = Candidate.find(@fight_result[:looser_id])
  end

  def create
    @fight = Fight.new(fight_result(params['fight']))

    if @fight.save
      redirect_to fight_path(@fight)
    else
      render :new
    end
  end

  private

  def fight_result(candidates)
    a = Candidate.find(candidates['candidate_a'])
    b = Candidate.find(candidates['candidate_b'])

    fight = {}

    a_attack = 0
    b_attack = 0
    loop do
      b.popularity_points = b.popularity_points - a.attack_strength
      a_attack += 1
      break if b.popularity_points <= 0

      a.popularity_points = a.popularity_points - b.attack_strength
      b_attack += 1
      break if a.popularity_points <= 0
    end
    if a.popularity_points > b.popularity_points
      fight['winner_id'] = a.id
      fight['looser_id'] = b.id
    else
      fight['winner_id'] = b.id
      fight['looser_id'] = a.id
    end
    fight['a_attack'] = a_attack
    fight['b_attack'] = b_attack
    fight
  end

  def fight_params
    params.require(:fight).permit(:winner_id, :loser_id, :a_attack, :b_attack)
  end
end
