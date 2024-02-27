class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
  def self.search_for(content, method)
  if method == 'perfect'
    Book.where('title = :content OR body = :content', content: content)
  elsif method == 'forward'
    Book.where('title LIKE :content OR body LIKE :content', content: "#{content}%")
  elsif method == 'backward'
    Book.where('title LIKE :content OR body LIKE :content', content: "%#{content}")
  else
    Book.where('title LIKE :content OR body LIKE :content', content: "%#{content}%")
  end
  end
end
