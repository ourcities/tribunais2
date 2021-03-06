Fabricator(:user) do
  first_name 'Josias'
  last_name 'Schneider'
  email { sequence(:email) {|i| "josias#{i}@test.com" } }
end

Fabricator(:task) do
  position { sequence(:position) }
  mailchimp_list_uid { sequence(:mailchimp_list_uid) }
  name { sequence(:name) {|i| "Task #{i}"} }
  mission 'Mission'
  slug { sequence(:slug) {|i| "task_#{i}"} }
end

Fabricator(:task_accomplishment) do
  user
  task
end
