def sign_up
  visit new_user_registration_path
  fill_in 'email', with: 'john@example.com'
  fill_in 'password', with: 'password'
  fill_in 'confirmation', with: 'password'
  fill_in 'username', with: 'im a user'
  click_button 'Sign up'

  expect(page).to have_content('Welcome! You have signed up successfully.')
  expect(page).to have_content('Sign Out')
end

def sign_in_as(user)
  visit new_user_session_path
  fill_in 'email', with: user.email
  fill_in 'password', with: user.password
  click_button "Log in"
end
