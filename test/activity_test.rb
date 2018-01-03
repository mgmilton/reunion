require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
  def setup
    @activity = Activity.new("hiking", {} ,60)
  end

  def test_it_has_a_name
    assert_equal "hiking", @activity.name
  end

  def test_add_participants_increases_particpants
    assert_equal 20, @activity.add_participant("buzz", 20)

    assert_equal 1, @activity.participants.length
  end

  def test_add_participant_only_accepts_strings_and_integers
    assert_raises ArgumentError do
      @activity.add_participant(3, "A")
    end

    assert_raises ArgumentError do
      @activity.add_participant(["a", "b"], "a")
    end
  end

  def test_total_cost_returns_sum_of_particpants_fees
    @activity.add_participant("buzz", 20)
    @activity.add_participant("wall-e", 40)

    assert_equal 60, @activity.total_cost
  end

  def test_cost_splitter
    @activity.add_participant("buzz", 20)
    @activity.add_participant("wall-e", 40)

    assert_equal 30, @activity.cost_splitter
  end

  def test_payment_calculator_returns_fees_due
    @activity.add_participant("buzz", 20)
    @activity.add_participant("wall-e", 40)

    assert_equal 10, @activity.payment_calculator("buzz")
  end

  def test_payment_calculator_only_accepts_strings
    assert_raises ArgumentError do
      @activity.payment_calculator(4)
    end

    assert_raises ArgumentError do
      @activity.payment_calculator(["a", "b"])
    end
  end
end
