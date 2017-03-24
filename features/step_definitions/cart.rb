When(/^вошел пользователь с email "([^"]*)" и паролем "([^"]*)"$/) do |email, password|
  visit('/users/sign_in')
  within("#new_user") do
    fill_in('user_email',    with: email)
    fill_in('user_password', with: password)
    click_button 'Log in'
  end
end

When(/^перейдет на страницу первого заведения$/) do
  visit('/places/1')
end

When(/^нажмет на кнопку Add To Cart у первого товара в заведении$/) do
  find(:xpath, '//*[@id="1"]').click
end

When(/^нажмет на кнопку Add To Cart у второго товара в заведении$/) do
  find(:xpath, '//*[@id="2"]').click
end

When(/^перейдет в корзину$/) do
  find(:xpath, '//*[@id="cart_button"]').click
end

When(/^в корзине отобразятся оба добавленных товара$/) do
  @first_cart_item = CartItem.first
  @last_cart_item = CartItem.last
  break unless find(:xpath, "//*[@id=#{@last_cart_item.id}]/div[1]/b[1]")['innerHTML'] == Item.find(2).title[0..15]
  break unless find(:xpath, "//*[@id=#{@first_cart_item.id}]/div[1]/b[1]")['innerHTML'] == Item.find(1).title[0..15]
end


When(/^нажмет на кнопку удалить товар из корзины$/) do
  find(:xpath, "//*[@id=#{@last_cart_item.id}]/div[1]/a").click
end

When(/^удаленый товар перестанет отображаться в корзине$/) do
  visit('/places/1')
  expect(page).not_to have_xpath("//*[@id=#{@last_cart_item.id}]/div[1]/a")
end