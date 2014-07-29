require 'rails_helper'

feature 'Kittens' do

  scenario 'User can categorize kittens' do
    user = create_user email: "user@example.com"
    Category.create!(name: "Cutest!")
    Kitten.create!(image: "http://i.imgur.com/tOzb0dUb.jpg")

    login(user)

    # wrap each image in a link with a class
    find(".kitten-link").click
    select "Cutest!", from: "categorization_category_id"
    click_on "Add Category"
    
    expect(page.current_path).to eq(root_path)
    within(".kitten") do
      expect(page).to have_content("Cutest!")
    end
  end

  def login(user)
    visit root_path
    click_on "Login"
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_on "Login"
  end
  
  scenario 'user cannot choose the same category for the same kitten more than once' do
    user = create_user email: "user@example.com"
    Category.create!(name: "Cutest!")
    Kitten.create!(image: "http://i.imgur.com/tOzb0dUb.jpg")

    login(user)

    find(".kitten-link").click
    select "Cutest!", from: "categorization_category_id"
    click_on "Add Category"

    find(".kitten-link").click
    select "Cutest!", from: "categorization_category_id"
    click_on "Add Category"
    
    expect(page).to have_content("Category has already been taken")
  end

end