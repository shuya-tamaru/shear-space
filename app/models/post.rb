class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  def self.search(search)
    return Post.all unless search
    Post.where('title LIKE(?)', "%#{search}%").or(Post.where('content LIKE(?)', "%#{search}%"))
  end

end
