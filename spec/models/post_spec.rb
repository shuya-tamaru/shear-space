require 'rails_helper'

RSpec.describe Post, type: :model do
  it "is valid with a title, content, category_id, image" do
    post = build(:post)
    expect(post).to be_valid
  end

  it "is invalid with empty title" do
    post = build(:post, title: "")
    post.valid?
    expect(post.errors[:title]).to include("を入力してください")
  end

  it "is invalid with empty content" do
    post = build(:post, content: "")
    post.valid?
    expect(post.errors[:content]).to include("を入力してください")
  end

  it "is invalid with empty category" do
    post = build(:post, category: nil)
    post.valid?
    expect(post.errors[:category]).to include("を入力してください")
  end

  it "is invalid with empty user" do
    post = build(:post, user: nil)
    post.valid?
    expect(post.errors[:user]).to include("を入力してください")
  end
end