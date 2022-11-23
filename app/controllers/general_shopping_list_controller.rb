class GeneralShoppingListController < ApplicationController
  def index
    @general_list = current_user.general_list
  end
end
