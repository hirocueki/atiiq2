require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    driven_by(:rack_test)
  end

  let!(:user) { create(:user) }
  scenario "ユーザーはログインができる" do
    visit root_path
    click_link 'ログイン'

    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: user.password

    click_button 'ログイン'

    expect(page).to have_content 'ログインしました'
  end
end
