# frozen_string_literal: true

class BadgesController < ApplicationController
  before_action :set_badge, only: %i[show destroy]

  # GET /badges
  def index
    @badges = Badge.all
  end

  # GET /badges/1
  def show; end

  # GET /badges/new
  def new
    @badge = Badge.new
  end

  # POST /badges
  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to @badge, notice: 'Badge was successfully created.'
    else
      render :new
    end
  end

  # DELETE /badges/1
  def destroy
    @badge.destroy
    redirect_to badges_url, notice: 'Badge was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_badge
    @badge = Badge.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def badge_params
    params.require(:badge).permit(:date, :name)
  end
end
