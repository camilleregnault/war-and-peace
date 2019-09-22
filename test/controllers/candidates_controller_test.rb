require 'test_helper'

class CandidatesControllerTest < ActionDispatch::IntegrationTest
  test 'should save new candidate' do
    candidate = Candidate.create(
      name: 'bobby singer',
      photo: 'http:://test_to_photo.com',
      popularity_points: 90,
      attack_strength: 20
    )
    assert_equal candidate['name'], 'bobby singer'
    assert_equal candidate['popularity_points'], 90
    assert_equal candidate['attack_strength'], 20
  end
end
