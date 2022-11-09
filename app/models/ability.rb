# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Recipe, public: true
      return unless user.present?
      can :read, :all, user: user
      can :create, :all
      can :destroy, :all, user: user
  end
end
