class Admin::BadgesController < Admin::BaseController
  before_action :find_badge, only: %i[edit show update destroy]

  def index
    @badges = Badge.all
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to :admin_badges
    else
      render :new
    end
  end

  def new
    @badge = Badge.new
  end

  def edit
  end

  def show
  end

  def update
    if @badge.update(badge_params)
      redirect_to :admin_badges
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to :admin_badges
  end

  private

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:title, :image_url, :rule_id, :rule_argument)
  end
end
