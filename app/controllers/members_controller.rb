class MembersController < ApplicationController
  before_action :set_members, only: :index
  before_action :set_member, only: :show

  def index; end

  def show; end

  private

  def set_members
    @members = Current.school.members
  end

  def set_member
    @member = Current.school.members.find(params[:id])
  end
end
