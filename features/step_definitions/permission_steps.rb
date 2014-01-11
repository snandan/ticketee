#permission_step = /^"(.*?)" can "(.*?)" ([0|i]n)?\s?the "(.*?)" project$/


Given(/^"(.*?)" can view the "(.*?)" project$/) do |user, project|
  Permission.create!(:user   => User.find_by_email!(user),
                     :thing  => Project.find_by_name!(project),
                     :action => "view")
end


Given(/^"(.*?)" can create tickets in the "(.*?)" project$/) do |user, project|
  Permission.create!(:user   => User.find_by_email!(user),
                     :thing  => Project.find_by_name!(project),
                     :action => "create tickets")
end

Given(/^"(.*?)" can edit tickets in the "(.*?)" project$/) do |user, project|
  Permission.create!(:user   => User.find_by_email!(user),
                     :thing  => Project.find_by_name!(project),
                     :action => "edit tickets")

  Permission.create!(:user   => User.find_by_email!(user),
                     :thing  => Project.find_by_name!(project),
                     :action => "update tickets")
  
end

Given(/^"(.*?)" can delete tickets in the "(.*?)" project$/) do |user, project|
  Permission.create!(:user   => User.find_by_email!(user),
                     :thing  => Project.find_by_name!(project),
                     :action => "delete tickets")
end

# Given permission_step do |user, permission, on, project|
#   create_permission(user, find_project(project), permission)
# end


# def create_permission(email, object, action)
#   Permission.create!(:user   => User.find_by_email!(email),
#                      :thing  => object,
#                      :action => action)
# end

# def find_project(name)
#   Project.find_by_name!(name)
# end
