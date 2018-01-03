class Activity
  attr_reader :name, :participants, :total_cost

  def initialize(name, participants = {}, total_cost = 0)
    @name = name
    @participants = participants
    @total_cost = total_cost
  end

  def add_participant(participant, price)
    argument_raiser(participant)
    argument_raiser(price, Integer)
    @participants[participant] = price
  end

  def cost_splitter
    @total_cost / @participants.length
  end

  def payment_calculator(person)
    argument_raiser(person)
    cost_splitter - @participants[person]
  end

  def argument_raiser(data_type, desired_class = String)
    if data_type.class != desired_class
      raise ArgumentError
    end
  end

end
