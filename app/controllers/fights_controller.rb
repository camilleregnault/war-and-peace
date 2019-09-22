# frozen_string_literal: true

# Fights controller
class FightsController < ApplicationController
  def index
    @candidates = Candidate.all
    @weapons = Weapon.all
  end

  def create
    fight = Fight.new(fight_result(params['fight']))
    redirect_to fight_path(fight) if fight.save
  end

  def show
    @fight_result = Fight.find(params['id'])
    @winner = Candidate.find(@fight_result[:winner_id])
    @looser = Candidate.find(@fight_result[:looser_id])
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

  def fight_result(fight)
    a = {}
    b = {}
    a['fighter'] = Candidate.find(fight['candidate_a'])
    a['nb_attack'] = 0
    b['fighter'] = Candidate.find(fight['candidate_b'])
    b['nb_attack'] = 0

    loop do
      b['fighter'].popularity_points -= a['fighter'].attack_strength
      a['nb_attack'] += 1
      return set_result_fight(a, b) if b['fighter'].popularity_points <= 0

      a['fighter'].popularity_points -= b['fighter'].attack_strength
      b['nb_attack'] += 1
      return set_result_fight(b, a) if a['fighter'].popularity_points <= 0
    end
  end

  def set_result_fight(winner, looser)
    fight = {}
    fight['winner_id'] = winner['fighter'].id
    fight['winner_nb_attack'] = winner['nb_attack']
    fight['looser_id'] = looser['fighter'].id
    fight['looser_nb_attack'] = looser['nb_attack']
    fight['detail'] = fight_detail(winner['fighter'], looser['fighter'], fight)
    fight
  end

  def fight_detail(winner, looser, fight)
    detail = []
    winner_attack = fight['winner_nb_attack']
    looser_attack = fight['looser_nb_attack']
    loop do
      break unless winner_attack.positive?

      if winner_attack.positive?
        detail.push("#{winner.name} attaque #{looser.name}.
          #{looser.name} perd #{winner.attack_strength} points de vie.")
        winner_attack -= 1
      end

      if looser_attack.positive?
        detail.push("#{looser.name} attaque #{winner.name}.
          #{winner.name} perd #{looser.attack_strength} point de vie.")
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
      :winner_nb_attack,
      :winner_weapon_id,
      :looser_id,
      :looser_nb_attack,
      :looser_weapon_id,
      :detail
    )
  end
end
