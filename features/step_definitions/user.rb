When(/^Гость перейдет на страницу регистрации$/) do
  visit ('/users/sign_up')
end

When(/^заполнит поля данными$/) do |table|
  within ("#new_user") do
    fill_in('Email',       with: table.hashes[0][:email])
    fill_in('Password', with: table.hashes[0][:password])
    fill_in('Password confirmation', with: table.hashes[0][:password_confirmation])
    click_button 'Sign up'
  end
end

When(/^в навбаре отобразится его email$/) do
  break unless find(:xpath, '//*[@id="navbar"]/ul/li[1]/a')['innerHTML'] == 'Hello, ' + User.last.email
end
