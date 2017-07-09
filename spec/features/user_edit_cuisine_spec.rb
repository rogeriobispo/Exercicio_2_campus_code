require 'rails_helper'

feature 'user update cuisine' do
  scenario 'successfully' do
    Cuisine.create(name: 'Arabiana')
    user = User.create(email: 'rogerio.bispo@yahoo.com.br',password: '123456')

    visit root_path
    login_as(user, :scope => :user)
    click_on 'Cozinhas'
    click_on 'Arabiana'

    fill_in 'Nome', with: 'Arabia'
    click_on 'Enviar'

    expect(page).to have_css('h1', text: 'Arabia')

  end

  scenario 'cant be empty' do
    Cuisine.create(name: 'Brasileira')
    user = User.create(email: 'rogerio.bispo@yahoo.com.br',password: '123456')

    visit root_path
    login_as(user, :scope => :user)
    click_on 'Cozinhas'
    click_on 'Brasileira'


    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Você deve informar o nome da cozinha')
  end

  scenario 'must be uniq' do
    Cuisine.create(name: 'Brasileira')
    Cuisine.create(name: 'Argentina')
    user = User.create(email: 'rogerio.bispo@yahoo.com.br',password: '123456')
    login_as(user, :scope => :user)
    visit new_cuisine_path
    fill_in 'Nome', with: 'Brasileira'
    click_on 'Enviar'
    expect(page).to have_content('Cozinha ja existe')

  end
end
