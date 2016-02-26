class Concert < ActiveRecord::Base
  has_many :comments

  validates :artist, presence: true
  validates :venue, presence: true
  validates :city, presence: true
  validates :price, presence: true
  validates :price, numericality: true
  validates :price, inclusion: 10.00..100.00
  validates :date, presence: true
  validates :description, presence: true

  def self.concerts_this_month
    from = Date.today
    to = from.end_of_month

    Concert.where(date: from..to)
  end

  def self.concerts_today
    from = Time.now.beginning_of_day
    to = Time.now.end_of_day

    Concert.where(date: from..to)
  end

end
