require 'rails_helper'

feature 'user_signup', type: :feature do

  let(:user) { create(:user) }
 
  scenario "user successfully signup" do
    visit users_path
    click_on(class: 'contents2__btn contents2__btn__mail')
    fill_in 'user_nickname', with: user.nickname
    fill_in 'user_email', with: "tonton@byebye.com"
    find('input[type="file"]').click
    attach_file  "app/assets/images/member_photo_noimage_thumb.png"
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password

    click_button "Sign up"
    expect(current_path).to eq root_path
    expect(page).to have_content('ログアウト')
  end

end
