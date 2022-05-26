class Admin::BadgesController < Admin::BaseController

  before_action :set_badge, only: %i[show destroy edit update]

  def index
    @badges = Badge.all
  end

  def show

  end

  def edit

  end

  def new
    @badge = Badge.new
  end

  def create

    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to [:admin, @badge], notice: t('.success')
    else
      render :new
    end
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path
    else
      render :index
    end
  end

  def destroy
    @badge.destroy

    redirect_to admin_badges_path
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :image_url, :rule, :rule_option)
  end

  def set_badge
    @badge = Badge.find(params[:id])
  end

end