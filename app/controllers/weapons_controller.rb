class WeaponsController < ApplicationController
  def create 
    @weapon = Weapon.new(weapon_params)
    @weapon.save
  end


  def weapon_params
    params.require(:weapon).permit(:name, :attack, :defence)
  end
end
