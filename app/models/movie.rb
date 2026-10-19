class Movie < ActiveRecord::Base
  RATINGS = %w[G PG PG-13 R NC-17].freeze

  validates :title, presence: true
  validates :rating, inclusion: { in: RATINGS }, allow_blank: true
  validates :release_date, presence: true
end
