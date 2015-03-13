# == Schema Information
#
# Table name: albums
#
#  id             :integer          not null, primary key
#  name           :string           not null
#  band_id        :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  recording_type :string
#

class Album < ActiveRecord::Base
  RECORDING_TYPES = %w(studio live)

  validates :name, :band_id, presence: true
  validates :recording_type, inclusion: {in: RECORDING_TYPES, allow_nil: true}

  belongs_to :band
  has_many :tracks, dependent: :destroy
end
