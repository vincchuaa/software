require 'csv'

class Groupmembers < ApplicationRecord
    def self.to_csv(email)
        attributes = ['Group Code', 'User Name']
        @groups = Group.where(groupSet:(Lecturer.find_by(email: email).currentGroupSet))
    
        CSV.generate(headers: true) do |csv|
          csv << attributes
    
          @groups.each do |group|
            if group.title != 'Unnassigned Team' 
              group.groupMembers.split(",").each do |member|
                csv << [group.groupCode, member]
              end
              group.update(final:true)
            end
          end
        end
    end
end
