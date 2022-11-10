# == Schema Information
#
# Table name: groups
#
#  id              :bigint           not null, primary key
#  deadline        :datetime
#  final           :boolean          default(FALSE)
#  groupCode       :string
#  groupMembers    :string           default("")
#  groupSet        :string
#  groupSize       :integer
#  moduleCode      :string
#  score           :integer          default(0)
#  title           :string
#  unwantedMembers :integer
#  updated         :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Group < ApplicationRecord

  # Returns a list of non preffered teammates from a group
  def self.findNonPrefferedTeammates(members, groupSet)
    groupMembers = members.split(",")
    group = Group.find_by(groupMembers: members)
    nonPreferredPartners = []

    #Iterates through each member in the group and find its non preffered partners
    for eachMember in groupMembers do
      if eachMember != ""
        nonPreferredPartner = Preference.find_by(username: eachMember).nonPartners
        if nonPreferredPartner != ""
          nonPreferredPartners.push(nonPreferredPartner)
        end
      end
    end
    return nonPreferredPartners
  end

  # Assign pairings to a group
  def self.assignStudents(groupSet)
    num_group = Group.where(groupSet: groupSet).count
    num_pair = Pairing.where(groupSet: groupSet).count
    groupCode = 1
    pairings = Pairing.where(groupSet: groupSet)

    #Assigning pairs into groups
    if num_group >= num_pair
      for pairing in pairings do
        preference_A = Preference.find_by(username: pairing.username_a, groupSet: groupSet)
        preference_B = Preference.find_by(username: pairing.username_b, groupSet: groupSet)
        group = Group.find_by(groupCode: groupCode, groupSet: groupSet)
        preference_A.update(groupCode: groupCode)
        preference_B.update(groupCode: groupCode)
        pairing.update(groupCode: groupCode)
        group.update(groupMembers: (pairing.username_a + "," + pairing.username_b))
        groupCode = groupCode.to_i + 1
      end
    else
      iterations = (num_pair/num_group.to_f).ceil
      for i in 1..iterations do
        for pairing in Pairing.where(groupSet:groupSet, groupCode:'')[0..(num_group.to_i-1)] do
          preference_A = Preference.find_by(username: pairing.username_a, groupSet: groupSet)
          preference_B = Preference.find_by(username: pairing.username_b, groupSet: groupSet)
          group = Group.find_by(groupSet: groupSet, groupCode: groupCode)
          if i == 1
            if group.groupMembers != "" 
              group.update(groupMembers: (group.groupMembers + "," + pairing.username_a + "," + pairing.username_b))
            else
              group.update(groupMembers: (pairing.username_a + "," + pairing.username_b))
            end
            pairing.update(groupCode: groupCode)
            preference_A.update(groupCode: groupCode)
            preference_B.update(groupCode: groupCode)
            groupCode = groupCode + 1
          else
            pairMembers = [pairing.username_a, pairing.username_b]
            for group in Group.where(groupSet:groupSet) do
              nonPreferredTeammatesOfCurrentGroup = Group.findNonPrefferedTeammates(group.groupMembers, groupSet)
              if !(nonPreferredTeammatesOfCurrentGroup & pairMembers).any?
                if group.groupMembers != ""
                  group.update(groupMembers: (group.groupMembers + "," + pairing.username_a + "," + pairing.username_b))
                else
                  group.update(groupMembers: (pairing.username_a + "," + pairing.username_b))
                end
                pairing.update(groupCode: group.groupCode)
                preference_A.update(groupCode: groupCode)
                preference_B.update(groupCode: groupCode)
                break
              end
            end
          end
        end
      end
    end

    #Calculates the score for each groups
    for group in Group.where(groupSet: groupSet) do
      score = 0
      currentGroupMembers =group.groupMembers.split(",")
      for member in currentGroupMembers do
        if member != ""
          domicile = Student.find_by(username: member).feeStatus
          if domicile == "Home"
            score = score + 1
          elsif domicile == "Overseas"
            score = score - 1
          end
        end
      end
      group.update(score: score)
    end

    preferences = Preference.where(groupSet: groupSet)
    pairings = Pairing.where(groupSet: groupSet)
    paired_names = []
    singletons = []
    maxTeamSize = Group.find_by(groupSet: groupSet).groupSize

    #Check if they are singletons
    for pairing in pairings do
      paired_names.push(pairing.username_a)
      paired_names.push(pairing.username_b)
    end

    for preference in preferences do
      if !paired_names.include?(preference.username)
        singletons.push(preference)
      end
    end
       
    #Append singletons into groups while checking their non preffered partners 
    for singleton in singletons do
      domicile = Student.find_by(username: singleton.username).feeStatus
      nonPreferredPartnersOfSingleton = singleton.nonPartners.split(",")
      nonPrefferedPartnersUsername = []

      for nonPrefferedPartner in nonPreferredPartnersOfSingleton do
        username = Preference.find_by(full_name: nonPrefferedPartner).username
        nonPrefferedPartnersUsername.push(username)
      end
      
      for group in Group.where(groupSet:groupSet) do
        nonPreferredTeammatesOfCurrentGroup = Group.findNonPrefferedTeammates(group.groupMembers,groupSet)
        currentGroupMembers = group.groupMembers.split(",")
        currentTeamSize = currentGroupMembers.size()
        maxTeamSize = group.groupSize
        score = group.score
        if currentTeamSize < maxTeamSize
          if !(currentGroupMembers&nonPrefferedPartnersUsername).any? & !(nonPreferredTeammatesOfCurrentGroup.include?singleton.full_name)
            if group.groupMembers != ""
              if (domicile == "Home") & (score <=0)
                group.update(groupMembers: (group.groupMembers + "," +  singleton.username), score: score + 1)
                singleton.update(groupCode: group.groupCode)
                break
              elsif (domicile == "Overseas") & (score > 0)
                group.update(groupMembers: (group.groupMembers + "," +  singleton.username), score: score - 1)
                singleton.update(groupCode: group.groupCode)
                break
              else
                group.update(groupMembers: (group.groupMembers + "," +  singleton.username), score: score - 1)
                singleton.update(groupCode: group.groupCode)
                break
              end 
            else
              if (domicile == "Home") & (score <=0)
                group.update(groupMembers: (singleton.username))
                singleton.update(groupCode: group.groupCode)
                break
              elsif (domicile == "Overseas") & (score > 0)
                group.update(groupMembers: (singleton.username))
                singleton.update(groupCode: group.groupCode)
                break
              else
                group.update(groupMembers: (singleton.username))
                singleton.update(groupCode: group.groupCode)
                break
              end 
            end
          end
        end
      end
    end
    group = Group.find_by(groupSet: groupSet)
    Group.create(deadline: group.deadline, groupCode: 'Unnassigned Team', groupMembers: '', groupSet: groupSet, groupSize: group.groupSize, moduleCode: group.moduleCode, score: 0, title: 'Unnassigned Team',  unwantedMembers: group.unwantedMembers)
  end

  def self.to_csv(email)
    attributes = ['Group Code', 'Title', 'Description', 'Group Set', 'Available', 'Personilization', 'Self Enroll', 'Max Enrollment', 'Show Members', 'Sign Up From Group', 'Sign Up Name', 'Sign Up Instructions']
    @groups = Group.where(groupSet:(Lecturer.find_by(email: email).currentGroupSet))
    CSV.generate(headers: true) do |csv|
      csv << attributes
      @groups.each do |group| 
          if group.title != 'Unnassigned Team'
            csv << [group.groupCode, group.title, '', group.groupSet, 'Y', '', 'N', '', '', '', '', '']
          end
      end
    end
  end
end
