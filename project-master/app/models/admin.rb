# == Schema Information
#
# Table name: admins
#
#  adminID    :integer
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  users_id   :bigint
#
# Indexes
#
#  index_admins_on_users_id  (users_id)
#
# Foreign Keys
#
#  fk_rails_...  (username => users.username)
#
class Admin < ApplicationRecord
    def self.import(file)

        CSV.foreach(file.path, headers: true) do |row|
            if Lecturer.find_by(email: row.field('Email')) != nil
              lecturer = Lecturer.find_by(email: row.field('Email'))
              module_list = lecturer.modules.split(",")
              if module_list.include?(row.field('Module Code'))
                nil
              else 
                module_list.push(row.field('Module Code'))
              end
              lecturer.update(modules: module_list.join(','))
            else
              if (User.find_by(email: row.field('Email'))) == nil
                puts ('HIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII')
                user = User.new(email: row.field('Email'))
                user.get_info_from_ldap
                user.lecturer = true
                user.save
              end
              Lecturer.create!(email:row.field('Email').downcase, modules:row.field('Module Code'), currentGroupSet: '')
            end
        end
      end
end
