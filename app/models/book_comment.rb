class BookComment < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :comment,presence:true,length:{maximum:20}
end
