# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

# user = User.new(username: 'aca20spc')
# user.get_info_from_ldap
# user.lecturer = true
# user.save
user = User.new(username: 'aca20rk')
user.get_info_from_ldap
# user.lecturer = true
user.admin = true
user.save
# user = User.new(username: 'acb19jmw')
# user.get_info_from_ldap
# user.lecturer = true
# user.save

# Lecturer.create(email:'spchua1@sheffield.ac.uk', senior:true, modules:'COM1001', currentGroupSet:'')
# User.where(username:'aca22mf').first_or_create(email:'MFrench1@sheffield.ac.uk',uid:'aca22mf',mail:'MFrench1@sheffield.ac.uk',ou:'COM',sn:'French',givenname:'Messiah')
# User.where(username:'aca22tjs').first_or_create(email:'TJStout1@sheffield.ac.uk',uid:'aca22tjs',mail:'TJStout1@sheffield.ac.uk',ou:'COM',sn:'Stout',givenname:'Theodore')
# User.where(username:'aca22dm').first_or_create(email:'DMunoz1@sheffield.ac.uk',uid:'aca22dm',mail:'DMunoz1@sheffield.ac.uk',ou:'COM',sn:'Munoz',givenname:'Diya')
# User.where(username:'aca22asc').first_or_create(email:'ASCarrillo2@sheffield.ac.uk',uid:'aca22asc',mail:'ASCarrillo2@sheffield.ac.uk',ou:'COM',sn:'Carrillo',givenname:'Alyson')
# User.where(username:'aca22en').first_or_create(email:'ENavarro1@sheffield.ac.uk',uid:'aca22en',mail:'ENavarro1@sheffield.ac.uk',ou:'COM',sn:'Navarro',givenname:'Efrain')
# User.where(email:'TestLecturer1@sheffield.ac.uk').first_or_create(sn:'Bozer',givenname:'Bob')

Student.destroy_all
Student.create!(username: 'aca20spc',forename:'Shei', middlename:'', surname:'Chua', feeStatus:'Home',gender:'Male',programme:'COMU103',modules:'COM1001, COM1002')
Student.create!(username: 'aca19haa', forename:'Harry', middlename:'', surname:'Akrill', feeStatus:'Home',gender:'Male',programme:'COMU103',modules:'COM1001, COM1002')
Student.create!(username: 'aca20rk', forename:'Rebanth', middlename:'', surname:'Kanner', feeStatus:'Home',gender:'Male',programme:'COMU103',modules:'COM1001, COM1002')
Student.create!(username: 'acb19jmw', forename:'Jack', middlename:'Minshull', surname:'Williamson', feeStatus:'Home',gender:'Male',programme:'COMU103',modules:'COM1001, COM1002')
Student.create!(username: 'aca20jmo', forename:'Jason ', middlename:'', surname:'Ong', feeStatus:'Home',gender:'Male',programme:'COMU103',modules:'COM1001, COM1002')
Student.create!(username: 'aca20am', forename:'Andreas', middlename:'', surname:'Michailidis', feeStatus:'Home',gender:'Male',programme:'COMU103',modules:'COM1001, COM1002')
Student.create!(username: 'aca19cum', forename:'Chigozim', middlename:'', surname:'Mogbolu', feeStatus:'Home',gender:'Male',programme:'COMU103',modules:'COM1001, COM1002')
Student.create!(username: 'aca20jm', forename:'Junya', middlename:'', surname:'Ma', feeStatus:'Home',gender:'Male',programme:'COMU103',modules:'COM1001, COM1002')
Student.create!(username:'aca22mf', forename:'Messiah', middlename:'', surname:'French', feeStatus:'Home',gender:'Male',programme:'COMU103',modules:'COM1001, COM1002')
Student.create!(username:'aca22tjs', forename:'Theodore', middlename:'Jay', surname:'Stout', feeStatus:'Home',gender:'Male',programme:'COMU119',modules:'COM1001, COM1002')
Student.create!(username:'aca22dm', forename:'Diya', middlename:'', surname:'Munoz', feeStatus:'Home',gender:'Female',programme:'COMU117',modules:'COM1001, COM1002')
Student.create!(username:'aca22asc', forename:'Alyson', middlename:'Sarah', surname:'Carrillo', feeStatus:'Home',gender:'Female',programme:'COMU117',modules:'COM1001, COM1002')
Student.create!(username:'aca22en', forename:'Efrain', middlename:'', surname:'Navarro', feeStatus:'Home',gender:'Male',programme:'COMU41',modules:'COM1001, COM1002')
Student.create!(username:'aca22mmq', forename:'Malachi', middlename:'Mitchell', surname:'Quinn', feeStatus:'Home',gender:'Male',programme:'COMU41',modules:'COM1001, COM1002')
Student.create!(username:'aca22mh', forename:'Meredith', middlename:'', surname:'Hess', feeStatus:'Home',gender:'Male',programme:'COMU41',modules:'COM1001, COM1002')
Student.create!(username:'aca22ch', forename:'Chandler', middlename:'', surname:'Hodge', feeStatus:'Home',gender:'Male',programme:'COMU41',modules:'COM1001, COM1002')
Student.create!(username:'aca22gm', forename:'Gustavo', middlename:'', surname:'Mitchell', feeStatus:'Home',gender:'Male',programme:'COMU41',modules:'COM1001, COM1002')
Student.create!(username:'aca22yw', forename:'Yadiel', middlename:'', surname:'Walls', feeStatus:'Home',gender:'Male',programme:'COMU41',modules:'COM1001, COM1002')
Student.create!(username:'aca22am', forename:'Asia', middlename:'', surname:'Mcguire', feeStatus:'Home',gender:'Male',programme:'COMU41',modules:'COM1001, COM1002')
Student.create!(username:'aca22nn', forename:'Nelson', middlename:'', surname:'Nicholson', feeStatus:'Home',gender:'Male',programme:'COMU41',modules:'COM1001, COM1002')
Student.create!(username:'aca22ks', forename:'Kayla', middlename:'', surname:'Stephenson', feeStatus:'Home',gender:'Male',programme:'COMU41',modules:'COM1001, COM1002')
Student.create!(username:'aca22oh', forename:'Omar', middlename:'', surname:'Huerta', feeStatus:'Home',gender:'Male',programme:'COMU41',modules:'COM1001, COM1002')
Student.create!(username:'aca22bsm', forename:'Brett', middlename:'May', surname:'Scott', feeStatus:'Home',gender:'Male',programme:'COMU41',modules:'COM1001, COM1002')
Student.create!(username:'aca22ra', forename:'Rodney', middlename:'', surname:'Ali', feeStatus:'Home',gender:'Male',programme:'COMU41',modules:'COM1001, COM1002')

Preference.destroy_all

#TO TEST ALGO
Preference.create!(feeStatus: 'Home', username: 'aca20spc', groupCode: '', full_name: 'Shei', partners: 'Harry', nonPartners: 'Adam', moduleCode: 'COM1001', gender: 'male', groupSet:'trial', filled:true)
Preference.create!(feeStatus: 'Home', username: 'aca19haa',groupCode: '', full_name: 'Harry', partners: 'Shei', nonPartners: '', moduleCode: 'COM1001', gender: 'male', groupSet:'trial', filled:true)
Preference.create!(feeStatus: 'Home',username: 'aca20rk' , groupCode: '', full_name: 'Rebanth', partners: 'Jack', nonPartners: '', moduleCode: 'COM1001', gender: 'male', groupSet:'trial', filled: true)
Preference.create!(feeStatus: 'Home',username: 'acb19jmw', groupCode: '', full_name: 'Jack', partners: 'Rebanth', nonPartners: '', moduleCode: 'COM1001', gender: 'male', groupSet:'trial', filled:true)
Preference.create!(feeStatus: 'Home',username: 'aca20jmo', groupCode: '', full_name: 'Jason', partners: 'Andreas', nonPartners: '', moduleCode: 'COM1001', gender: 'male', groupSet:'trial', filled:true)
Preference.create!(feeStatus: 'Home',username: 'aca20am', groupCode: '', full_name: 'Andreas', partners: 'Jason', nonPartners: '', moduleCode: 'COM1001', gender: 'male', groupSet:'trial', filled:true)
Preference.create!(feeStatus: 'Home',username: 'aca19cum', groupCode: '', full_name: 'Chigozim', partners: 'Junyu', nonPartners: 'Shei', moduleCode: 'COM1001', gender: 'female', groupSet:'trial', filled:true)
Preference.create!(feeStatus: 'Home',username: 'aca20jm', groupCode: '', full_name: 'Junyu', partners: 'Chigozim', nonPartners: 'Jason', moduleCode: 'COM1001', gender: 'male', groupSet:'trial', filled:true)
Preference.create!(feeStatus: 'Home',username: 'aca22tjs', groupCode: '', full_name: 'Tijih', partners: 'Dim', nonPartners: 'Yves', moduleCode: '', gender: 'male', groupSet: 'trial', filled: false)
Preference.create!(feeStatus: 'Home',username: 'aca22dm', groupCode: '', full_name: 'Dim', partners: 'Tijih', nonPartners: '', moduleCode: '', gender: 'male', groupSet: 'trial', filled: false)
Preference.create!(feeStatus: 'Home',username: 'aca22asc', groupCode: '', full_name: 'Adam', partners: '', nonPartners: '', moduleCode: '', gender: 'male', groupSet: 'trial', filled: false)
Preference.create!(feeStatus: 'Home',username: 'aca22en', groupCode: '', full_name: 'Eva', partners: '', nonPartners: '', moduleCode: '', gender: 'male', groupSet: 'trial', filled: false)
Preference.create!(feeStatus: 'Home',username: 'aca22mmq', groupCode: '', full_name: 'Mark', partners: '', nonPartners: '', moduleCode: '', gender: 'male', groupSet: 'trial', filled: false)
Preference.create!(feeStatus: 'Home',username: 'aca22mh', groupCode: '', full_name: 'Moo', partners: '', nonPartners: '', moduleCode: '', gender: 'male', groupSet: 'trial', filled: false)
Preference.create!(feeStatus: 'Home',username: 'aca22ch', groupCode: '', full_name: 'Curry', partners: 'Gon', nonPartners: '', moduleCode: '', gender: 'male', groupSet: 'trial', filled: false)
Preference.create!(feeStatus: 'Home',username: 'aca22gm', groupCode: '', full_name: 'Gon', partners: '', nonPartners: '', moduleCode: '', gender: 'male', groupSet: 'trial', filled: false)
Preference.create!(feeStatus: 'Home',username: 'aca22yw', groupCode: '', full_name: 'Yves', partners: '', nonPartners: '', moduleCode: '', gender: 'male', groupSet: 'trial', filled: false)
Preference.create!(feeStatus: 'Home',username: 'aca22am', groupCode: '', full_name: 'Amber', partners: '', nonPartners: '', moduleCode: '', gender: 'male', groupSet: 'trial', filled: false)
Preference.create!(feeStatus: 'Home',username: 'aca22nn', groupCode: '', full_name: 'Nine', partners: '', nonPartners: 'Shei', moduleCode: '', gender: 'male', groupSet: 'trial', filled: false)
Preference.create!(feeStatus: 'Home',username: 'aca22ks', groupCode: '', full_name: 'Kim', partners: '', nonPartners: '', moduleCode: '', gender: 'male', groupSet: 'trial', filled: false)
Preference.create!(feeStatus: 'Home',username: 'aca22oh', groupCode: '', full_name: 'Orange', partners: '', nonPartners: '', moduleCode: '', gender: 'male', groupSet: 'trial', filled: false)
Preference.create!(feeStatus: 'Home',username: 'aca22bsm', groupCode: '', full_name: 'Bill', partners: '', nonPartners: '', moduleCode: '', gender: 'male', groupSet: 'trial', filled: false)
Preference.create!(feeStatus: 'Home',username: 'aca22ra', groupCode: '', full_name: 'Regan', partners: '', nonPartners: '', moduleCode: '', gender: 'male', groupSet: 'trial', filled: false)


# Preference.create!(feeStatus: 'Home',username: 'aca20spc', groupCode: '1', full_name: 'Shei', partners: 'Harry', nonPartners: 'Adam', moduleCode: 'COM1002', gender: 'male', groupSet:'trial1', filled:true)
# Preference.create!(feeStatus: 'Home',username: 'aca19haa',groupCode: '1', full_name: 'Harry', partners: 'Shei', nonPartners: 'Mark', moduleCode: 'COM1002', gender: 'male', groupSet:'trial1', filled:true)
# Preference.create!(feeStatus: 'Home',username: 'aca20rk' , groupCode: '1', full_name: 'Rebanth', partners: 'Jack', nonPartners: '', moduleCode: 'COM1002', gender: 'male', groupSet:'trial1', filled: true)
# Preference.create!(feeStatus: 'Home',username: 'acb19jmw', groupCode: '1', full_name: 'Jack', partners: 'Rebanth', nonPartners: '', moduleCode: 'COM1002', gender: 'male', groupSet:'trial1', filled:true)
# Preference.create!(feeStatus: 'Home',username: 'aca20jmo', groupCode: '3', full_name: 'Jason', partners: 'Andreas', nonPartners: '', moduleCode: 'COM1002', gender: 'male', groupSet:'trial1', filled:true)
# Preference.create!(feeStatus: 'Home',username: 'aca20am', groupCode: '3', full_name: 'Andreas', partners: 'Jason', nonPartners: '', moduleCode: 'COM1002', gender: 'male', groupSet:'trial1', filled:true)
# Preference.create!(feeStatus: 'Home',username: 'aca19cum', groupCode: '2', full_name: 'Chigozim', partners: 'Junyu', nonPartners: 'Shei', moduleCode: 'COM1002', gender: 'female', groupSet:'trial1', filled:true)
# Preference.create!(feeStatus: 'Home',username: 'aca20jm', groupCode: '2', full_name: 'Junyu', partners: 'Chigozim', nonPartners: 'Jason', moduleCode: 'COM1002', gender: 'male', groupSet:'trial1', filled:true)
# Preference.create!(feeStatus: 'Home',username: 'aca22tjs', groupCode: '2', full_name: 'Tijih', partners: 'Dim', nonPartners: '', moduleCode: 'COM1002', gender: 'male', groupSet: 'trial1', filled: false)
# Preference.create!(feeStatus: 'Home',username: 'aca22dm', groupCode: '2', full_name: 'Dim', partners: 'Tijih', nonPartners: '', moduleCode: 'COM1002', gender: 'male', groupSet: 'trial1', filled: false)
# Preference.create!(feeStatus: 'Home',username: 'aca22asc', groupCode: '3', full_name: 'Adam', partners: 'Eva', nonPartners: '', moduleCode: 'COM1002', gender: 'male', groupSet: 'trial1', filled: false)
# Preference.create!(feeStatus: 'Home',username: 'aca22en', groupCode: '3', full_name: 'Eva', partners: 'Adam', nonPartners: '', moduleCode: 'COM1002', gender: 'male', groupSet: 'trial1', filled: false)
# Preference.create!(feeStatus: 'Home',username: 'aca22mmq', groupCode: '4', full_name: 'Mark', partners: 'Moo', nonPartners: '', moduleCode: 'COM1002', gender: 'male', groupSet: 'trial1', filled: false)
# Preference.create!(feeStatus: 'Home',username: 'aca22mh', groupCode: '4', full_name: 'Moo', partners: 'Mark', nonPartners: '', moduleCode: 'COM1002', gender: 'male', groupSet: 'trial1', filled: false)
# Preference.create!(feeStatus: 'Home',username: 'aca22ch', groupCode: '1', full_name: 'Curry', partners: '', nonPartners: 'Kim', moduleCode: 'COM1002', gender: 'male', groupSet: 'trial1', filled: false)
# Preference.create!(feeStatus: 'Home',username: 'aca22gm', groupCode: '3', full_name: 'Gon', partners: '', nonPartners: '', moduleCode: 'COM1002', gender: 'male', groupSet: 'trial1', filled: false)
# Preference.create!(feeStatus: 'Home',username: 'aca22yw', groupCode: '2', full_name: 'Yves', partners: '', nonPartners: '', moduleCode: 'COM1002', gender: 'male', groupSet: 'trial1', filled: false)
# Preference.create!(feeStatus: 'Home',username: 'aca22am', groupCode: '4', full_name: 'Amber', partners: '', nonPartners: '', moduleCode: 'COM1002', gender: 'male', groupSet: 'trial1', filled: false)
# Preference.create!(feeStatus: 'Home',username: 'aca22nn', groupCode: '4', full_name: 'Nine', partners: '', nonPartners: '', moduleCode: 'COM1002', gender: 'male', groupSet: 'trial1', filled: false)
# Preference.create!(feeStatus: 'Home',username: 'aca22ks', groupCode: '4', full_name: 'Kim', partners: '', nonPartners: '', moduleCode: 'COM1002', gender: 'male', groupSet: 'trial1', filled: false)
# Preference.create!(feeStatus: 'Home',username: 'aca22oh', groupCode: '5', full_name: 'Orange', partners: '', nonPartners: '', moduleCode: 'COM1002', gender: 'male', groupSet: 'trial1', filled: false)
# Preference.create!(feeStatus: 'Home',username: 'aca22bsm', groupCode: '5', full_name: 'Bill', partners: '', nonPartners: '', moduleCode: 'COM1002', gender: 'male', groupSet: 'trial1', filled: false)
# Preference.create!(feeStatus: 'Home',username: 'aca22ra', groupCode: '5', full_name: 'Regan', partners: '', nonPartners: '', moduleCode: 'COM1002', gender: 'male', groupSet: 'trial1', filled: false)

Pairing.destroy_all
#TO TEST ALGO
Pairing.create!(groupCode: '', groupSet: 'trial', username_a: 'aca20spc', name_a: 'Shei', username_b: 'aca19haa', name_b:'Harry')
Pairing.create!(groupCode: '', groupSet: 'trial', username_a: 'aca20rk', name_a: 'Rebanth', username_b: 'acb19jmw', name_b: 'Jack')
Pairing.create!(groupCode: '', groupSet: 'trial', username_a: 'aca20jm', name_a: 'Junyu', username_b: 'aca19cum', name_b: 'Chigozim',)
Pairing.create!(groupCode: '', groupSet: 'trial', username_a: 'aca20jmo', name_a: 'Jason', username_b: 'aca20am', name_b: 'Andreas')
Pairing.create!(groupCode: '', groupSet: 'trial', username_a: 'aca22tjs', name_a: 'Tijih', username_b: 'aca22dm', name_b: 'Dim')
Pairing.create!(groupCode: '', groupSet: 'trial1', username_a: 'aca22asc', name_a: 'Adam', username_b: 'aca22en', name_b: 'Eva')
Pairing.create!(groupCode: '', groupSet: 'trial1', username_a: 'aca22mmq', name_a: 'Mark', username_b: 'aca22mh', name_b: 'Moo')

Group.destroy_all
#TO TEST ALGO
Group.create!(deadline: nil, groupCode:'1', groupMembers:'', title: 'Group 1', groupSet:'trial', groupSize:5, moduleCode:'COM1001', unwantedMembers: 3, score: 0)
Group.create!(deadline: nil, groupCode:'2', groupMembers:'', title: 'Group 2', groupSet:'trial', groupSize:5, moduleCode:'COM1001', unwantedMembers: 3, score: 0)
Group.create!(deadline: nil, groupCode:'3', groupMembers:'', title: 'Group 3', groupSet:'trial', groupSize:5, moduleCode:'COM1001', unwantedMembers: 3, score: 0)
Group.create!(deadline: nil, groupCode:'4', groupMembers:'', title: 'Group 4', groupSet:'trial', groupSize:5, moduleCode:'COM1001', unwantedMembers: 3, score: 0)
Group.create!(deadline: nil, groupCode:'5', groupMembers:'', title: 'Group 5', groupSet:'trial', groupSize:5, moduleCode:'COM1001', unwantedMembers: 3, score: 0)


# Group.create!(deadline: nil, groupCode:'1', groupMembers:'aca20spc, aca19haa, aca20rk, acb19jmw, aca22ch', title: 'Group 1', groupSet:'trial1', groupSize:5, moduleCode:'COM1002', unwantedMembers: 3)
# Group.create!(deadline: nil, groupCode:'2', groupMembers:'aca19cum, aca20jm, aca22tjs, aca22dm, aca22yw', title: 'Group 2', groupSet:'trial1', groupSize:5, moduleCode:'COM1002', unwantedMembers: 3)
# Group.create!(deadline: nil, groupCode:'3', groupMembers:'aca20jmo, aca20am, aca22asc, aca22en, aca22gm', title: 'Group 3', groupSet:'trial1', groupSize:5, moduleCode:'COM1002', unwantedMembers: 3)
# Group.create!(deadline: nil, groupCode:'4', groupMembers:'aca22mmq, aca22mh, aca22am, aca22nn, aca22ks', title: 'Group 4', groupSet:'trial1', groupSize:5, moduleCode:'COM1002', unwantedMembers: 3)
# Group.create!(deadline: nil, groupCode:'5', groupMembers:'aca22oh, aca22bsm, aca22ra', title: 'Group 5', groupSet:'trial1', groupSize:5, moduleCode:'COM1002', unwantedMembers: 3)
# Group.create!(deadline: nil, groupCode:'unnasignteam', groupMembers:'', title: 'Unnassigned Team', groupSet:'trial1', groupSize:5, moduleCode:'COM1002', unwantedMembers: 3)


Lecturer.destroy_all
Lecturer.create(email:'jmwilliamson1@sheffield.ac.uk', senior:true, modules:'COM1002', currentGroupSet:'')
Lecturer.create(email:'rkanner1@sheffield.ac.uk', senior:true, modules:'COM1002', currentGroupSet:'')
Lecturer.create(email:'amichailidis4@sheffield.ac.uk', senior:true, modules:'COM1002', currentGroupSet:'')