require 'rails_helper'

feature 'user_signin', type: :feature do

  let(:user) { FactoryBot.create(:user) }
  
  scenario "user successfully login" do
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button "ログイン"
    expect(current_path).to eq root_path
    expect(page).to have_content('ログアウト')
  end

  scenario "user doesn't login with invalid information" do
    visit new_user_session_path
    fill_in 'user_email', with: ""
    fill_in 'user_password', with: user.password
    click_button "ログイン"
    expect(current_path).to eq new_user_session_path
    expect(page).to have_content('Eメールまたはパスワードが違います。')
  end

end

feature 'user_signout', type: :feature do

  let(:user) { FactoryBot.create(:user) }
  
  scenario "user successfully signout" do
    #ログインする
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button "ログイン"
    expect(current_path).to eq root_path
    expect(page).to have_content('ログアウト')

    # ログアウトのテスト
    click_on(class: 'log__btn')
    expect(current_path).to eq root_path
    expect(page).to have_content('ログイン')
  end

end