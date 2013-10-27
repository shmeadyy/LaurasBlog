class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }  #makes sure that all titles are at least 5 chars long
end
