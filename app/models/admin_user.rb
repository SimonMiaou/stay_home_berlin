# frozen_string_literal: true

class AdminUser < ApplicationRecord
  devise :confirmable, :database_authenticatable, :lockable, :recoverable, :rememberable, :trackable, :validatable
end
