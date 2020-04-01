require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a nickname, password, password_confirmation, image" do
    user = build(:user)
    expect(user).to be_valid
  end

  it "is invalid without a nickname" do
    user = build(:user, nickname: "")
    user.valid?
    expect(user.errors[:nickname]).to include("を入力してください")
  end

  it "is invalid without a password" do
    user = build(:user, password: "")
    user.valid?
    expect(user.errors[:password]).to include("を入力してください")
  end

  it "is invalid without a password_confirmation" do
    user = build(:user, password_confirmation: "")
    user.valid?
    expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
  end

  it "is invalid without a password_confirmation" do
    user = build(:user, password_confirmation: "")
    user.valid?
    expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
  end

  it "is invalid with 6letters password" do
    user = build(:user, password: "123abc",password_confirmation: "123abc" )
    user.valid?
    expect(user.errors[:password]).to include("は7文字以上で入力してください")
  end

  it "is invalid password which is not Half-width alphanumerics" do
    user = build(:user, password: "１２３アイウエ",password_confirmation: "１２３アイウエ" )
    user.valid?
    expect(user.errors[:password]).to include("半角英字と数字両方を含むパスワードかつ7文字以上128文字以下")
  end

  it "is valid without a image" do
    user = build(:user, image: "")
    expect(user).to be_valid
  end

end