# == Schema Information
#
# Table name: directors
#
#  id         :integer          not null, primary key
#  bio        :text
#  dob        :date
#  image      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Director < ApplicationRecord
  validates(:name, presence: true)

  has_many(:filmography, class_name: "Movie")

  def filmography
    key = self.id

    the_many = Movie.where({ :director_id => key })

    return the_many
  end
end
