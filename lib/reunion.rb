require './lib/activity.rb'
class Reunion
  attr_reader :location, :activities

  def initialize(location, activities = [])
    @location = location
    @activities = activities
  end

  def add_activity(activity, participants = {}, cost = 0)
    argument_raiser(activity)
    argument_raiser(participants, Hash)
    argument_raiser(cost, Integer)
    @activities << Activity.new(activity, participants, cost)
  end

  def total_cost
    @activities.reduce(0) do |cost, activity|
      cost += activity.total_cost
      cost
    end
  end

  def debt_collector(participant)
    argument_raiser(participant)
    @activities.reduce(0) do |total_owed, activity|
      total_owed += activity.payment_calculator(participant)
      total_owed
    end
  end

  def argument_raiser(data_type, desired_class = String)
    if data_type.class != desired_class
      raise ArgumentError
    end
  end

end
