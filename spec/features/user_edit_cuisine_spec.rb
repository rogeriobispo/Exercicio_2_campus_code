require 'rails_helper'

feature 'user update cuisine' do
  scenario 'successfully' do
    Cuisine.create(name: 'Arabiana')

    visit root_path
    click_on 'Cozinhas'
    click_on 'Arabiana'

    fill_in 'Nome', with: 'Arabia'
    click_on 'Enviar'

    expect(page).to have_css('h1', text: 'Arabia')

  end

  scenario 'cant be empty' do
    Cuisine.create(name: 'Brasileira')

    visit root_path
    click_on 'Cozinhas'
    click_on 'Brasileira'


    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_css('h3', text: 'Você deve informar o nome da cozinha')
  end

  scenario 'must be uniq' do
    Cuisine.create(name: 'Brasileira')
    Cuisine.create(name: 'Argentina')

    visit new_cuisine_path
    fill_in 'Nome', with: 'Brasileira'
    click_on 'Enviar'
    expect(page).to have_css('h3', text: 'Cozinha ja existe')

  end
end
