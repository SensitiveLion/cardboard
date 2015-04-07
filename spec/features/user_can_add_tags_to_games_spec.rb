require 'rails_helper'
require 'helpers'

feature 'user adds tags to game' do
  let(:game) { FactoryGirl.create(:game) }
  let(:tag) { FactoryGirl.create(:tag) }
  let(:user) { FactoryGirl.create(:user) }

  scenario 'user submits and adds new tag to game' do
    sign_in_as(user)
    visit game_path(game)
    click_link "add a tag"
    click_link "click here to enter a new tag"
    fill_in 'tag', with: "strategy"
    click_button 'add tag'
    expect(page).to have_content("strategy")
    expect(page).to have_content("what the gamers say")
  end

  scenario 'user creates non-unique tag' do
    sign_in_as(user)
    visit game_path(game)
    click_link "add a tag"
    click_link "click here to enter a new tag"
    fill_in 'tag', with: "strategy"
    click_button 'add tag'
    expect(page).to have_content("strategy")
    expect(page).to have_content("what the gamers say")
    click_link "add a tag"
    click_link "click here to enter a new tag"
    fill_in 'tag', with: "strategy"
    click_button 'add tag'
    expect(page).to have_content("tag already exists")
    expect(page).to have_content("enter a new tag")
  end

  scenario 'user applies an existing tag to a game' do
    sign_in_as(user)
    tag
    visit game_path(game)
    click_link "add a tag"
    find('#game_tag_tag_id').find(:xpath, 'option[1]').select_option
    click_button 'add a tag'
    expect(page).to have_content(tag.name)
    expect(page).to have_content("what the gamers say")
  end

  scenario 'user applies a duplicate tag to game' do
    sign_in_as(user)
    tag
    visit game_path(game)
    click_link "add a tag"
    find('#game_tag_tag_id').find(:xpath, 'option[1]').select_option
    click_button 'add a tag'
    expect(page).to have_content(tag.name)
    expect(page).to have_content("what the gamers say")
    click_link "add a tag"
    find('#game_tag_tag_id').find(:xpath, 'option[1]').select_option
    click_button 'add a tag'
    expect(page).to have_content("select or add a new tag")
    expect(page).to have_content("Tag has already been taken")
  end
end
