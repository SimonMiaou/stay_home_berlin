# frozen_string_literal: true

class BusinessesController < ApplicationController
  def index; end

  def show; end

  private

  def business
    @business ||= Business.find(params[:id])
  end
  helper_method :business

  def businesses
    @businesses ||= Business.order('RANDOM()')
  end
  helper_method :businesses
end
