# == Schema Information
#
# Table name: preferences
#
#  id          :bigint           not null, primary key
#  feeStatus   :string
#  filled      :boolean
#  full_name   :string
#  gender      :string
#  groupCode   :string
#  groupSet    :string
#  moduleCode  :string
#  nonPartners :string
#  partners    :string
#  username    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Preference < ApplicationRecord
end
