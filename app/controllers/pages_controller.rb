# frozen_string_literal: true

class PagesController < ApplicationController
  def show; end

  private

  def page
    @page ||= Page.find_by(slug: params[:slug])
  end
  helper_method :page
end
