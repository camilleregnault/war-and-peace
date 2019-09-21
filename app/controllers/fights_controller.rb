class FightsController < ApplicationController
  def index
    @candidates = Candidate.all
  end

  def show
    @fight_result = Fight.last
    @winner = Candidate.find(@fight_result[:winner_id])
    @looser = Candidate.find(@fight_result[:looser_id])
    @fight_details = fight_detail(@winner, @looser, @fight_result)
  end

  def create
    @fight = Fight.new(fight_result(params['fight']))
    redirect_to fight_path(@fight) if @fight.save
  end

  private

  def fight_result(candidates)
    a = Candidate.find(candidates['candidate_a'])
    b = Candidate.find(candidates['candidate_b'])

    a_attack = 0
    b_attack = 0
    loop do
      b.popularity_points = b.popularity_points - a.attack_strength
      a_attack += 1
      return set_result_fight(a.id, b.id, a_attack, b_attack) if b.popularity_points <= 0

      a.popularity_points = a.popularity_points - b.attack_strength
      b_attack += 1
      return set_result_fight(b.id, a.id, b_attack, a_attack) if b.popularity_points <= 0
    end
  end

  def set_result_fight(winner_id, looser_id, winner_nb_attack, looser_nb_attack)
    fight = {}
    fight['winner_id'] = winner_id
    fight['looser_id'] = looser_id
    fight['winner_nb_attack'] = winner_nb_attack
    fight['looser_nb_attack'] = looser_nb_attack
    fight
  end

  def fight_detail(winner, looser, fight_result)
    detail = []
    winner_attack = fight_result['winner_nb_attack']
    looser_attack = fight_result['looser_nb_attack']
    loop do
      break unless winner_attack.positive?

      if winner_attack.positive?
        detail.push("#{winner.name} attaque #{looser.name}. #{looser.name} perd #{winner.attack_strength} points de vie.")
        winner_attack -= 1
      end

      if looser_attack.positive?
        detail.push("#{looser.name} attaque #{winner.name}. #{winner.name} perd #{looser.attack_strength} point de vie.")
        looser_attack -= 1
      else
        detail.push("#{looser.name} est mort.")
      end
    end
    detail
  end

  def fight_params
    params.require(:fight).permit(
      :winner_id,
      :looser_id,
      :winner_nb_attack_attack,
      :looser_nb_attack
    )
  end
end
