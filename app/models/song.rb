class Song < ApplicationRecord
  # Cannot be repeated by the same artist in the same year
  validates :title, presence: true, uniqueness: { scope: :year, message: "can only happen once per year" }
  validates :released, inclusion: { in: [true, false] }
  # [x] Optional if released is false
  # [ ]Must not be blank if released is true
  # [x] Must be less than or equal to the current year
  validates :year, numericality: { only_integer: true, less_than_or_equal_to: Time.now.year }, presence: true, if: :released?
  validates :artist_name, presence: true

  def released?
    released == true
  end
end
