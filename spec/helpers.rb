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

def create_game(user)
  FactoryGirl.create(:game, user: user)
end

def make_review_for_game(game)
  visit game_path(game)
  click_link "review this game"
  fill_in "your review", with: "Butcher McSweeney's High Life, PBR&B +1
      single-origin coffee 8-bit stumptown distillery messenger bag XOXO
      Vice meditation tilde. Chia fashion axe flannel pickled biodiesel
      retro four dollar toast tote bag art party, keffiyeh mustache artisan
      mumblecore tofu."
  select 5, from: "rating"
  click_button "add review"
end

def make_review_for_game1(game)
  visit game_path(game)
  click_link "review this game"
  fill_in "your review", with: "Butcher McSweeney's High Life, PBR&B +1
      single-origin coffee 8-bit stumptown distillery messenger bag XOXO
      Vice meditation tilde. Chia fashion axe flannel pickled biodiesel
      retro four dollar toast tote bag art party, keffiyeh mustache artisan
      mumblecore tofu."
  select 10, from: "rating"
  click_button "add review"
end

def add_comment
  click_link "add comment"
  fill_in "your comment", with: "something comment something"
  click_button "add comment"
end

def add_review
  click_link "review this game"
  fill_in "your review", with: "Butcher McSweeney's High Life, PBR&B +1
      single-origin coffee 8-bit stumptown distillery messenger bag XOXO
      Vice meditation tilde. Chia fashion axe flannel pickled biodiesel
      retro four dollar toast tote bag art party, keffiyeh mustache artisan
      mumblecore tofu. something something something"
  click_button "add review"
end

def game_user
  visit new_user_registration_path
  fill_in 'email', with: 'john@example.com'
  fill_in 'password', with: 'password'
  fill_in 'confirmation', with: 'password'
  fill_in 'username', with: 'im as user'

  click_button 'Sign up'
end

