class Post < ActiveRecord::Base
  validates :title, presence: true,
                    length: { minimum: 5 }  #makes sure that all titles are at least 5 chars long
end
