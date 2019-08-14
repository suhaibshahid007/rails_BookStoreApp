# frozen_string_literal: true

class Book < ApplicationRecord
	belongs_to :user
	belongs_to :category
end
