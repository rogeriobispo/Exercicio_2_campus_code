require 'rails_helper'

feature 'user update cuisine' do
  scenario 'successfully' do
    cuisine = Cuisine.create(name: 'Arabiana')

    visit root_path
    click_on 'Arabiana'
    click_on 'Editar'

    fill_in 'Nome', with: 'Arabia'
    click_on 'Enviar'

    expect(page).to have_css('h1', 'Arabia')

  end
  scenario 'cant be empty' do
    cuisine = Cuisine.create(name: 'Brasileira')

    visit root_path
    click_on 'Brasileira'
    click_on 'Editar'

    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_css('h3', 'Cozinha deve ter um nome')
  end

end
