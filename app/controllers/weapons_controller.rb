# frozen_string_literal: true

# Weapons controller
class WeaponsController < ApplicationController
  def create
    @weapon = Weapon.new(weapon_params)
    @weapon.save
  end

  private

  def weapon_params
    params.require(:weapon).permit(:name, :attack, :defence)
  end
end
