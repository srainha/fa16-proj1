# == Schema Information
#
# Table name: pokemons
#
#  id         :integer          not null, primary key
#  name       :string
#  string     :string
#  level      :string
#  integer    :string
#  trainer_id :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  health     :integer
#

class Pokemon < ActiveRecord::Base
	belongs_to :trainer
end
