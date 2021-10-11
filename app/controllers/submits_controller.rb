class SubmitsController < ApplicationController
  before_action :set_badge, only: :success

  # POST /submits
  def create
    badge = Badge.find(create_params[:badge_id])
    SubmitBadgeService.new(badge, PostHashService).run

    redirect_to success_submit_path(badge)
  end

  private

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def create_params
    params.permit(:badge_id)
  end
end
