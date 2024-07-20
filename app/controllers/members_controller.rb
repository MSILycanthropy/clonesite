class MembersController < ApplicationController
  before_action :set_members, only: :index
  before_action :set_member, only: [ :show, :edit, :update ]

  def index; end

  def show; end

  def edit
    @member.build_phone_number if @member.phone_number.nil?
    @member.build_email_address if @member.email_address.nil?
  end

  def update
    @member.update(member_params)

    render :show
  end

  private

  def member_params
    params.require(:member).permit(:first_name, :last_name, :pin, :birthday, :sex,
      :status, phone_number_attributes: [ :id, :number ], email_address_attributes: [ :id, :address ])
  end

  def set_members
    @members = Current.school.members
  end

  def set_member
    @member = Current.school.members.find(params[:id])
  end
end
