# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  album_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  lyrics     :text
#  track_type :string
#

class Track < ActiveRecord::Base
  TRACK_TYPES = %w(regular bonus)

  validates :name, :album_id, presence: true
  validates :track_type, inclusion: {in: TRACK_TYPES}
  belongs_to :album
end
