Then(/^an email from "(.*?)" to Gilmar Mendes should be sent just once$/) do |arg1|
  emails = ActionMailer::Base.deliveries.select do |mailer|
    mailer.to.include?(ENV['GILMAR_MENDES_EMAIL']) && mailer.from.include?(arg1)
  end

  expect(emails).to have(1).email
end

Then(/^an email from "(.*?)" to Rodrigo Janot should be sent just once$/) do |arg1|
  emails = ActionMailer::Base.deliveries.select do |mailer|
    mailer.to.include?(ENV['RODRIGO_JANOT_EMAIL']) && mailer.from.include?(arg1)
  end

  expect(emails).to have(1).email
end

Then(/^an email from "(.*?)" to Carlos Zarattini should be sent just once$/) do |arg1|
  emails = ActionMailer::Base.deliveries.select do |mailer|
    mailer.to.include?(ENV['CARLOS_ZARATTINI_EMAIL']) && mailer.from.include?(arg1)
  end

  expect(emails).to have(1).email
end

Then(/^an email from "(.*?)" to "(.*?)" me should be sent$/) do |arg1, arg2|
  emails = ActionMailer::Base.deliveries.select do |mailer|
    mailer.to.include?(arg2) && mailer.from.include?(arg1)
  end

  expect(emails).to be_any
end

Then(/^I should see "(.*?)" task accomplished$/) do |arg1|
  if arg1 == "poke Gilmar Mendes"
    expect(page).to have_css(".tasks-menu li#poke_gilmar_mendes.accomplished")
  elsif arg1 == "poke Rodrigo Janot"
    expect(page).to have_css(".tasks-menu li#poke_rodrigo_janot.accomplished")
  elsif arg1 == "poke Carlos Zarattini"
    expect(page).to have_css(".tasks-menu li#poke_carlos_zarattini.accomplished")
  elsif arg1 == "share on Facebook"
    expect(page).to have_css(".tasks-menu li#share_on_facebook.accomplished")
  elsif arg1 == "share on Twitter"
    expect(page).to have_css(".tasks-menu li#share_on_twitter.accomplished")
  else
    raise "I don't know task '#{arg1}'"
  end
end

Then(/^I should see "(.*?)" task unaccomplished$/) do |arg1|
  if arg1 == "poke Gilmar Mendes"
    expect(page).to_not have_css(".tasks-menu li#poke_gilmar_mendes.accomplished")
  else
    raise "I don't know task '#{arg1}'"
  end
end

Then(/^I should see "(.*?)" task$/) do |arg1|
  if arg1 == "poke Gilmar Mendes"
    expect(page).to have_css("#poke_gilmar_mendes")
  elsif arg1 == "poke Rodrigo Janot"
    expect(page).to have_css("#poke_rodrigo_janot")
  elsif arg1 == "poke Carlos Zarattini"
    expect(page).to have_css("#poke_carlos_zarattini")
  elsif arg1 == "share on Facebook"
    expect(page).to have_css("#share_on_facebook")
  elsif arg1 == "share on Twitter"
    expect(page).to have_css("#share_on_twitter")
  else
    raise "I don't know task '#{arg1}'"
  end
end

Given(/^there is a task "(.*?)"$/) do |arg1|
  if arg1 == "poke Gilmar Mendes"
    Fabricate(:task, position: 1, slug: "poke_gilmar_mendes")
  elsif arg1 == "poke Rodrigo Janot"
    Fabricate(:task, position: 2, slug: "poke_rodrigo_janot")
  elsif arg1 == "poke Carlos Zarattini"
    Fabricate(:task, position: 3, slug: "poke_carlos_zarattini")
  elsif arg1 == "share on Facebook"
    Fabricate(:task, position: 4, slug: "share_on_facebook")
  elsif arg1 == "share on Twitter"
    Fabricate(:task, position: 5, slug: "share_on_twitter")
  else
    raise "I don't know task '#{arg1}'"
  end
end

Given(/^this user accomplished "(.*?)"$/) do |arg1|
  if arg1 == "poke Gilmar Mendes"
    Fabricate(:task_accomplishment, user: @user, task: Task.find_by_slug("poke_gilmar_mendes"))
  elsif arg1 == "poke Rodrigo Janot"
    Fabricate(:task_accomplishment, user: @user, task: Task.find_by_slug("poke_rodrigo_janot"))
  elsif arg1 == "share on Facebook"
    Fabricate(:task_accomplishment, user: @user, task: Task.find_by_slug("share_on_facebook"))
  else
    raise "I don't know task '#{arg1}'"
  end
end
