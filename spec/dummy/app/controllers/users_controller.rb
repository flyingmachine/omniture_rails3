class User
  attr_reader :id
  def initialize(id)
    @id = id
  end  
end

class UsersController < ApplicationController
  def show
    @member = User.new(params[:id])
  end
end