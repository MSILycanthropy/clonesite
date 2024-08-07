class MembershipTemplatesController < AuthenticatedController
  layout "settings"

  before_action :set_membership_templates, only: :index

  def index; end

  def new
    @membership_template = MembershipTemplate.new(price: nil, late_fee: nil, registration_fee: nil)
  end

  def create
    @membership_template = MembershipTemplate.build(membership_template_params)

    if @membership_template.save!
      redirect_to(membership_templates_path)
    else
      response.status = :unprocessable_entity

      render :new
    end
  end

  def edit
    @membership_template = MembershipTemplate.find(params[:id])
  end

  def update
    @membership_template = MembershipTemplate.find(params[:id])
    @membership_template.assign_attributes(membership_template_params)

    if @membership_template.save!
      redirect_to(membership_templates_path)
    else
      response.status = :unprocessable_entity

      render :edit
    end
  end

  def destroy
    @membership_template = MembershipTemplate.find(params[:id])

    @membership_template.destroy!

    if MembershipTemplate.count.positive?
      render turbo_stream: turbo_stream.remove("membership_template_#{@membership_template.id}")
    else
      redirect_to action: :index
    end
  end

  private

  def membership_template_params
    params.require(:membership_template).permit(:name, :trial, :end_behavior, :duration_type, :term_length,
      :term_interval, :billing_type, :price, :late_fee, :registration_fee, :cancellation_fee,
      :recurring_billing_length, :recurring_billing_interval, :recurring_billing_payments
    ).compact_blank.with_defaults(late_fee: 0, registration_fee: 0, cancellation_fee: 0)
  end

  def set_membership_templates
    @membership_templates = MembershipTemplate.all
  end
end
