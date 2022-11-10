# == Schema Information
#
# Table name: students
#
#  id         :bigint           not null, primary key
#  feeStatus  :string
#  forename   :string
#  gender     :string
#  middlename :string
#  modules    :string
#  programme  :string
#  surname    :string
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ApplicationRecord

end
