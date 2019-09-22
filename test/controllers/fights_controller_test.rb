require 'test_helper'

class FightsControllerTest < ActionDispatch::IntegrationTest
  test 'should save new fight' do
    fight = Fight.create(
      winner_id: 1,
      winner_nb_attack: 3,
      winner_weapon_id: 1,
      looser_id: 2,
      looser_nb_attack: 2,
      looser_weapon_id: 2
    )
    assert_equal fight['winner_id'], 1
    assert_equal fight['winner_nb_attack'], 3
    assert_equal fight['winner_weapon_id'], 1
    assert_equal fight['looser_id'], 2
    assert_equal fight['looser_nb_attack'], 2
    assert_equal fight['looser_weapon_id'], 2
  end
end
