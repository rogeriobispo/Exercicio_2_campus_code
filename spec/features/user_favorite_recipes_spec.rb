require 'rails_helper'

feature 'User favorite receita' do
  scenario 'successfuly' do
     arabian_cuisine = Cuisine.create(name: 'Arabe')
     brazilian_cuisine = Cuisine.create(name: 'Brasileira')
     user = User.create(email: 'rogerio.bispo@yahoo.com.br',password: '123456')

     appetizer_type = RecipeType.create(name: 'Entrada')
     main_type = RecipeType.create(name: 'Prato Principal')
     dessert_type = RecipeType.create(name: 'Sobremesa')

     recipe = Recipe.create(title: 'Bolodecenoura', recipe_type: main_type,
                           cuisine: arabian_cuisine, difficulty: 'Médio',
                           cook_time: 50,
                           ingredients: 'Farinha, açucar, cenoura',
                           method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

      visit root_path
      login_as(user, scope: :user)
      click_on 'favoritar'
      expect(page).to have_content('Receita favoritada')
  end

  scenario 'User visit favorite list' do
     arabian_cuisine = Cuisine.create(name: 'Arabe')
     brazilian_cuisine = Cuisine.create(name: 'Brasileira')
     user = User.create(email: 'rogerio.bispo@yahoo.com.br',password: '123456')

     appetizer_type = RecipeType.create(name: 'Entrada')
     main_type = RecipeType.create(name: 'Prato Principal')
     dessert_type = RecipeType.create(name: 'Sobremesa')

    recipe1 = Recipe.create(title: 'Bolodecenoura1', recipe_type: main_type,
                         cuisine: arabian_cuisine, difficulty: 'Médio',
                         cook_time: 50,
                         ingredients: 'Farinha, açucar, cenoura',
                         method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
    recipe2 = Recipe.create(title: 'Bolodecenoura2', recipe_type: main_type,
                         cuisine: arabian_cuisine, difficulty: 'Médio',
                         cook_time: 50,
                         ingredients: 'Farinha, açucar, cenoura',
                         method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
    recipe3 = Recipe.create(title: 'Bolodecenoura3', recipe_type: main_type,
                         cuisine: arabian_cuisine, difficulty: 'Médio',
                         cook_time: 50,
                         ingredients: 'Farinha, açucar, cenoura',
                         method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
    visit root_path
    login_as(user, scope: :user)
    click_on 'Minhas favoritas'
    expect(page).to have_css('h1', 'Bolodecenoura1')
    expect(page).to have_css('h1', 'Bolodecenoura2')
    expect(page).to have_css('h1', 'Bolodecenoura3')

  end
end
