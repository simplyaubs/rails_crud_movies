require 'spec_helper'

feature 'CRUD movies' do
  scenario 'User can create a list of movies' do
    visit '/'
    expect(page).to have_content 'Welcome'
    click_on 'Add a movie'
    fill_in 'Title', with: 'Frozen'
    fill_in 'Rating', with: 3
    click_on 'Add movie'
    expect(page).to have_content 'Frozen'
    expect(page).to have_content 3
  end
end