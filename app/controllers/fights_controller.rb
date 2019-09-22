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
    fights = Fight.last(10)
    @fight_summaries = []
    fights.each do |fight|
      summary = {}
      summary['winner'] = Candidate.find(fight['winner_id'])
      summary['winner_nb_attack'] = fight['winner_nb_attack']
      summary['winner_weapon'] = Weapon.find(fight['winner_weapon_id'])
      summary['looser'] = Candidate.find(fight['looser_id'])
      summary['looser_nb_attack'] = fight['looser_nb_attack']
      summary['looser_weapon'] = Weapon.find(fight['looser_weapon_id'])
      summary['detail'] = fight['detail']
      @fight_summaries.push(summary)
    end
  end

  private

  def fight_result(fight)
    a = {}
    b = {}
    a['fighter'] = Candidate.find(fight['candidate_a'])
    a['weapon'] = Weapon.find(fight['weapon_a'])
    a['fighter'].attack_strength += a['weapon'].attack
    a['fighter'].popularity_points += a['weapon'].defence
    a['nb_attack'] = 0
    b['fighter'] = Candidate.find(fight['candidate_b'])
    b['weapon'] = Weapon.find(fight['weapon_b'])
    b['fighter'].attack_strength += b['weapon'].attack
    b['fighter'].popularity_points += b['weapon'].defence
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
    fight['winner_weapon_id'] = winner['weapon'].id
    fight['winner_nb_attack'] = winner['nb_attack']
    fight['looser_id'] = looser['fighter'].id
    fight['looser_weapon_id'] = looser['weapon'].id
    fight['looser_nb_attack'] = looser['nb_attack']
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
        detail.push("#{winner['fighter'].name} attaque #{looser['fighter'].name}
          avec #{winner['weapon'].name}.
          #{looser['fighter'].name} perd #{winner['fighter'].attack_strength}
          points de vie.")
        winner_attack -= 1
      end

      if looser_attack.positive?
        detail.push("#{looser['fighter'].name} attaque #{winner['fighter'].name}
          avec #{looser['weapon'].name}.
          #{winner['fighter'].name} perd #{looser['fighter'].attack_strength}
          point de vie.")
        looser_attack -= 1
      else
        detail.push("#{looser['fighter'].name} est mort.")
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
