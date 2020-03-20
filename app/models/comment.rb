class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :text,  presence: true
  validates :user,  presence: true
  validates :movie,  presence: true
  validates :user_id, uniqueness: { scope: :movie_id }
end
