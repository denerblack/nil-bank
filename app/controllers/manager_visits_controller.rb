class ManagerVisitsController < ApplicationController
  def index
    @visits = ManagerVisit.all
  end

  def create
    current_user.build_manager_visits(manager: User.where(manager: true).first )
  end

end
