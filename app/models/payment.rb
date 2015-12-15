# domain object
# using non A/R objects


class Payment
  AMEX = "AMEX"
  def initialize(name, amount, card_type)
  end

  def use_amex?
    true
  end
end
