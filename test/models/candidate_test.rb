require 'test_helper'

class CandidateTest < ActiveSupport::TestCase
  test 'raise error when candidate name is nil' do
    candidate = Candidate.create(name: nil)
    assert_equal "Name can't be blank", candidate.errors.full_messages[0]
  end

  test 'raise error when candidate popularity_points is under 30' do
    candidate = Candidate.create(
      name: 'test',
      photo: File.open('/dev/null'),
      popularity_points: 2,
      attack_strength: 20
    )
    assert_equal 'Popularity points must be greater than 29',
                 candidate.errors.full_messages[0]
  end

  test 'raise error when candidate popularity_points is over 100' do
    candidate = Candidate.create(
      name: 'test',
      photo: File.open('/dev/null'),
      popularity_points: 200,
      attack_strength: 20
    )
    assert_equal 'Popularity points must be less than 101',
                 candidate.errors.full_messages[0]
  end

  test 'raise error when candidate photo is empty' do
    candidate = Candidate.create(
      name: 'test',
      photo: nil,
      popularity_points: 80,
      attack_strength: 20
    )
    assert_equal 'Photo can\'t be blank',
                 candidate.errors.full_messages[0]
  end

  test 'raise error when candidate attack_strength is under 30' do
    candidate = Candidate.create(
      name: 'test',
      photo: File.open('/dev/null'),
      popularity_points: 80,
      attack_strength: 2
    )
    assert_equal 'Attack strength must be greater than 9',
                 candidate.errors.full_messages[0]
  end

  test 'raise error when candidate attack_strength is over 100' do
    candidate = Candidate.create(
      name: 'test',
      photo: File.open('/dev/null'),
      popularity_points: 80,
      attack_strength: 200
    )
    assert_equal 'Attack strength must be less than 26',
                 candidate.errors.full_messages[0]
  end
end

