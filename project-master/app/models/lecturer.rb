# == Schema Information
#
# Table name: lecturers
#
#  id              :bigint           not null, primary key
#  currentGroupSet :string
#  currentTeam     :string
#  email           :string
#  modules         :string
#  senior          :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'csv'

class Lecturer < ApplicationRecord
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
        if Student.find_by(username: row.field('Student Username')) != nil
          student = Student.find_by(username: row.field('Student Username'))
          module_list = student.modules.split(",")
          if module_list.include?(row.field('Module Code'))
            nil
          else 
            module_list.push(row.field('Module Code'))
          end
          student.update(modules: module_list.join(','))
        else
          middlename = row.field('Middle Names')
          if middlename == nil
            middlename = ""
          end
          if (User.find_by(username: row.field('Student Username'))) == nil
            puts ('HIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII')
            user = User.new(username: row.field('Student Username'))
            user.get_info_from_ldap
            user.save
          end
          Student.create!(forename:row.field('Forename'), middlename:middlename, surname:row.field('Surname'), username:row.field('Student Username').downcase, feeStatus:row.field('Fee Status'), programme:row.field('Programme'), gender:'', modules:row.field('Module Code'))
        end
    end
  end



  
end
