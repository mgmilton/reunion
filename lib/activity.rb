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
    if @participants[person].nil?
      0
    else
      cost_splitter - @participants[person]
    end
    #@participants.merg(@particpants) do |key, value|
    #split_costs - value
    #end

    # @participants.transform_values |amount|
    # split_costs - value
    # end
  end

  # if assuming cost is sum of participants cash added
  # issue with not making this assumption, is the total cost of a event might not be met by the participants cash added
  # def total_cost
  #   @participants.values.sum
  # end

  def argument_raiser(data_type, desired_class = String)
    if data_type.class != desired_class
      raise ArgumentError
    end
  end

end
