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

  scenario 'User can update a movie from list' do
    visit '/'
    expect(page).to have_content 'Welcome'
    click_on 'Add a movie'
    fill_in 'Title', with: 'Frozen'
    fill_in 'Rating', with: 3
    click_on 'Add movie'
    expect(page).to have_content 'Frozen'
    expect(page).to have_content 3
    click_on 'Frozen'
    expect(page).to have_content 'Frozen'
    expect(page).to have_content 3
    click_on 'Edit'
    fill_in 'Title', with: 'The Princess Bride'
    fill_in 'Rating', with: 10
    click_on 'Update movie'
    expect(page).to have_content 'The Princess Bride'
    expect(page).to have_content 10
    expect(page).to_not have_content 'Frozen'
    expect(page).to_not have_content 3
  end

  scenario 'User can delete a movie from list' do
    visit '/'
    expect(page).to have_content 'Welcome'
    click_on 'Add a movie'
    fill_in 'Title', with: 'Frozen'
    fill_in 'Rating', with: 3
    click_on 'Add movie'
    expect(page).to have_content 'Frozen'
    expect(page).to have_content 3
    click_on 'Frozen'
    expect(page).to have_content 'Frozen'
    expect(page).to have_content 3
    click_on 'Delete'
    expect(page).to_not have_content 'Frozen'
    expect(page).to_not have_content 3
  end
end