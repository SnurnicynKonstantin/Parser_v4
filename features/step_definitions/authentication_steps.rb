Given /^a user visits the signin page$/ do
  visit 'users/sign_in'
end

Given /^the user has (not )?an account$/ do |not_account|
  if not_account?

  else
    @user = User.create(name: 'Example User', email: 'user@example.com',
                        password: '12345678', password_confirmation: '12345678')
  end

end

Given /^the user signout$/ do
  p title
  p page.find('#exit')[:id]
  click_link 'Exit'
end

Given /^the user submits valid signin information$/ do
  fill_in 'user_email',    with: @user.email
  fill_in 'user_password', with: @user.password
  click_button 'enter'
end

Then /^he should see his profile page$/ do
  page.should have_title(@user.name)
end

Then /^he should see a signout link$/ do
  # p current_path
  # p page.find('#exit')[:id]
  page.should have_css('#exit')
end

Then /^he should see main page$/ do
  current_path.should == root_path
end