# Consider a Use Case which will be created from business in the form of an action, or verb to be accomplished.
# This is the time and place to discuss the tasks with a domain expert.
# It's okay to think linear / procedural is when the business case comes in
# Finding out what they want to happen once 'run' happens.

# Then, those individual steps get pushed into objects
# The controller knows that each of these tasks has a #run method. So, why not call this collection of objects 'Runners'?

module Runner
  class PayBill
    def initialize(payment)
      @payment = payment
    end

    def run
      paymentRepository = if @payment.use_amex?
                              Repos::StripePayment.new
                            else
                              BraintreePaymentRepository.new
                          end

      paymentRepository.process(@payment)
      # _dw Homework
      #  how to assert this #process method gets called on proper repo object?
    end


    # Don't assume you can add the attr_reader...
    # For example, attr_reader :payment
    # By not thinking about it and adding the attr reader I will expose the 'payment' method. Runners should only have 2 methods, #initialize and #run.

    # But if I were to run #instance_methods(false) I get a '3' when in fact in only want them to know about #run
    # So, if I need to expose it, make it private so only my class / objects can call it.
  end
end
