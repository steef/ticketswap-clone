class TicketPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def initialize(listing, ticket)
      @listing  = listing
      @ticket = ticket
  end

  def show?
    if @ticket.user_id?
      false
    else
      true
    end
  end
end
