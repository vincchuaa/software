# == Schema Information
#
# Table name: pairings
#
#  id         :bigint           not null, primary key
#  groupCode  :string
#  groupSet   :string
#  name_a     :string
#  name_b     :string
#  username_a :string
#  username_b :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Pairing < ApplicationRecord
end
