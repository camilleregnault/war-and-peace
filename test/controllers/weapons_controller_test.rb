require 'test_helper'

class WeaponsControllerTest < ActionDispatch::IntegrationTest
  test 'should save new weapon' do
    weapon = Weapon.create(
      name: 'sword',
      attack: 10,
      defence: 10
    )
    assert_equal weapon['name'], 'sword'
    assert_equal weapon['attack'], 10
    assert_equal weapon['defence'], 10
  end
end
