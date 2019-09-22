class FightsController < ApplicationController
  def index
    @candidates = Candidate.all
    @weapons = Weapon.all
  end

  def show
    @fight_result = Fight.last
    @winner = Candidate.find(@fight_result[:winner_id])
    @looser = Candidate.find(@fight_result[:looser_id])
  end

  def create
    @fight = Fight.new(fight_result(params['fight']))
    redirect_to fight_path(@fight) if @fight.save
  end

  def history
    @fights = Fight.last(10)
  end

  private

  def add_weapon(a, b)
    weapon_a = Weapon.find(params['fight']['weapon_a'])
    weapon_b = Weapon.find(params['fight']['weapon_b'])
    a.attack_strength += weapon_a.attack
    a.popularity_points += weapon_a.defence
    b.attack_strength += weapon_b.attack
    b.popularity_points += weapon_b.defence
  end

  def fight_result(candidates)
    # To randomize the first player
    if rand(1..2) == 1
      a = Candidate.find(candidates['candidate_a'])
      b = Candidate.find(candidates['candidate_b'])
    else
      b = Candidate.find(candidates['candidate_a'])
      a = Candidate.find(candidates['candidate_b'])
    end

    a_attack = 0
    b_attack = 0
    loop do
      b.popularity_points -= a.attack_strength
      a_attack += 1
      return set_result_fight(a, b, a_attack, b_attack) if b.popularity_points <= 0

      a.popularity_points -= b.attack_strength
      b_attack += 1
      return set_result_fight(b, a, b_attack, a_attack) if a.popularity_points <= 0
    end
  end

  def set_result_fight(winner, looser, winner_nb_attack, looser_nb_attack)
    fight = {}
    fight['winner_id'] = winner.id
    fight['winner_name'] = winner.name
    fight['winner_photo'] = winner.photo
    fight['winner_nb_attack'] = winner_nb_attack
    fight['looser_id'] = looser.id
    fight['looser_name'] = looser.name
    fight['looser_photo'] = looser.photo
    fight['looser_nb_attack'] = looser_nb_attack
    fight['detail'] = fight_detail(winner, looser, fight)
    fight
  end

  def fight_detail(winner, looser, fight)
    detail = []
    winner_attack = fight['winner_nb_attack']
    looser_attack = fight['looser_nb_attack']
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
      :winner_name,
      :winner_photo,
      :winner_nb_attack,
      :looser_id,
      :looser_name,
      :looser_photo,
      :looser_nb_attack,
      :detail
    )
  end
end
