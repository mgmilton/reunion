require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'

class ReunionTest < Minitest::Test

  def setup
    @reunion = Reunion.new("Sheboygan")
  end

  def test_add_activities_increments_activity
    @reunion.add_activity("badminton")
    assert_equal 1, @reunion.activities.length
  end

  def test_add_activity_accepts_string_hash_integer_only
    assert_raises ArgumentError do
      @reunion.add_activity(3, "A", "b")
    end

    assert_raises ArgumentError do
      @reunion.add_activity(["a", "b"], "a", "b")
    end
  end


  def test_total_cost_returns_reunion_cost
    @reunion.add_activity("badminton", {}, 30)
    @reunion.add_activity("ice fishing", {}, 40)
    assert_equal 70 ,@reunion.total_cost
  end

  def test_debt_collector_returns_particpants_debt
    @reunion.add_activity("badminton",{"buzz" => 15, "wall-e" => 30, "woody" => 8}, 30)
    @reunion.add_activity("ice fishing", {"buzz" => 15, "wall-e" => 40}, 40)

    assert_equal 2, @reunion.debt_collector("woody")
  end

  def test_debt_collector_only_accepts_strings
    assert_raises ArgumentError do
      @reunion.debt_collector(3)
    end

    assert_raises ArgumentError do
      @reunion.debt_collector(["a", "b"])
    end
  end

end
