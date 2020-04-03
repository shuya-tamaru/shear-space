class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :title, presence: true
  validates :content, presence: true
  validates_associated :images

  def self.search(search)
    return Post.all unless search
    Post.where('title LIKE(?)', "%#{search}%").or(Post.where('content LIKE(?)', "%#{search}%"))
  end

end
