class Plant < ApplicationRecord
  has_many :plot_plants, dependent: :destroy
  has_many :plots, through: :plot_plants
  has_many :gardens, through: :plots

  def self.unique_plants_harvested_in_one_hundred
    where('days_to_harvest < ?', 100).distinct
  end

  def self.by_popularity
    joins(:plot_plants).group('plants.id').order('COUNT(plot_plants.id) DESC')
  end
end
