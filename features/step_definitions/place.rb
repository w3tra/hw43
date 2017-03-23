When(/^залогинен пользователь с email "([^"]*)" и паролем "([^"]*)"$/) do |email, password|
  visit('/users/sign_in')
  within("#new_user") do
    fill_in('user_email',    with: email)
    fill_in('user_password', with: password)
    click_button 'Log in'
  end
end

When(/^создаст заведение с данными:$/) do |table|
  visit('/admin/places/new')
  within ("#new_place") do
    fill_in('place_title',       with: table.hashes[0][:title])
    fill_in('place_description', with: table.hashes[0][:description])
    click_button 'Create Place'
  end
end

When(/^заведение "([^"]*)" видно в списке заведений$/) do |title|
  visit('/admin/places')
  page.has_content?(title)
end

When(/^отредактирует заведение "([^"]*)" с данными:$/) do |arg, table|
  visit('/admin/places')
  find(:xpath, '//*[@id="place_6"]/td[6]/div/a[2]').click
  within ("#edit_place") do
    fill_in('place_title',       with: table.hashes[0][:title])
    fill_in('place_description', with: table.hashes[0][:description])
    click_button 'Update Place'
  end
end

When(/^отредактированное заведение "([^"]*)" видно в списке заведений$/) do |title|
  visit('admin/places')
  page.has_content?(title)
end

When(/^удалит заведение "([^"]*)"$/) do |title|
  visit('/admin/places')
  find(:xpath, '//*[@id="place_6"]/td[6]/div/a[3]').click
  accept_alert
  save_and_open_page
end

When(/^заведение "([^"]*)" не видно в списке заведений$/) do |title|
  expect(page).not_to have_content(title)
end