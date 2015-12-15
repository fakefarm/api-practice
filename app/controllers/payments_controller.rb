class PaymentsController < ApplicationController
  def create
    # Get data from params and validate
    payment = Payment.new("Sue Smith", 100, Payment::AMEX)
    # extracted from form, email, csv, etc.

    payBill = Runner::PayBill.new(payment)
    # linear steps.

    response = payBill.run

    render plain: "OK"
  end
end

=begin

## HTTP layer
@MikeGehard helped me make a $1 payment from Stripe.

In doing so, we started with the question of "What's the endpoint?".

That had us start in a discussion about 'outside-in development'
We setup the route and controller then wrote objects we wanted to work with

Other topics we discussed for another time...
- testing controllers
- controller responses
- working with PORO
- do not work with strings - either use objects or namespaced
- testing mocks

=end
