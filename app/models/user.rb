class User < ApplicationRecord

  has_many :comments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :phone_number, format: { with: /\A[+]?\d+(?>[- .]\d+)*\z/, allow_nil: true }


  scope :most_active, -> {
    select('users.id, users.name, users.created_at, COUNT(comments.id) AS comments_count')
        .joins(:comments)
        .where('comments.created_at' => (Time.now - 7.days)..Time.now)
        .group(:id)
        .order('comments_count DESC')
        .limit(10)
  }
end
