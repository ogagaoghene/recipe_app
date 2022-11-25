# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can %i[index], Recipe

    can %i[destroy show new create], Recipe, user: user
    can :show, Recipe, public: true

    can %i[add_ingredient destroy_ingredient], Recipe, user:
  end
end
