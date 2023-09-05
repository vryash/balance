class Invoice < ApplicationRecord
  belongs_to :user

  OPERATORS = { inc: '+', dec: '-' }.freeze

  scope :by_range, -> (start_date, end_date) { where("created_at >= ? AND created_at <= ?", start_date, end_date) }
  scope :before_date, -> (date) { where("AND created_at <= ?", date) }

  #TODO: before two dates - first to start, end to first

  def self.summary
    eval(pluck(:operator, :amount).join)
  end
end
