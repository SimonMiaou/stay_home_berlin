# frozen_string_literal: true

class BusinessesController < ApplicationController
  def index; end

  private

  def businesses
    @businesses ||= Business.all
  end
  helper_method :businesses
end
