When(/^создаст товар с данными:$/) do |table|
  visit('/admin/items/new')
  within ("#new_item") do
    select(table.hashes[0][:place], from: 'Place')
    fill_in('Title',       with: table.hashes[0][:title])
    fill_in('Description', with: table.hashes[0][:description])
    fill_in('Price',       with: table.hashes[0][:price])
    click_button 'Create Item'
  end
end

When(/^товар "([^"]*)" видно в списке товаров$/) do |arg|
  visit('/admin/items')
  find(:xpath, '//*[@id="item_19"]/td[3]')
end

When(/^отредактирует товар "([^"]*)" с данными:$/) do |arg, table|
  visit('/admin/items')
  find(:xpath, '//*[@id="item_19"]/td[9]/div/a[2]').click
    within ("#edit_item") do
      select(table.hashes[0][:place], from: 'Place')
      fill_in('Title',       with: table.hashes[0][:title])
      fill_in('Description', with: table.hashes[0][:description])
      fill_in('Price',       with: table.hashes[0][:price])
      click_button 'Update Item'
    end
end

When(/^отредактированный товар  "([^"]*)" видно в списке товаров$/) do |arg|
  visit('/admin/items')
  find(:xpath, '//*[@id="item_16"]/td[3]')
end

When(/^удалит товар "([^"]*)"$/) do |arg|
  visit('/admin/items')
  find(:xpath, '//*[@id="item_19"]/td[9]/div/a[3]').click
  accept_alert
end

When(/^товар "([^"]*)" не видно в списке товаров$/) do |arg|
  expect(page).not_to have_xpath('//*[@id="item_19"]/td[3]')
end