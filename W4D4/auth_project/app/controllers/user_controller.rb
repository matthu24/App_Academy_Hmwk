class UsersController < ApplicationController
  before_action :require_current_user!, except: [:create,:new]
    before_action :validate_user, except: [:create,:new]
end
