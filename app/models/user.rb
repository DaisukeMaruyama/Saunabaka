class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum is_deleted:{Deleted: true, Nondeleted: false}

  #is_deletedされていない（false）ならログイン可能
  def active_for_authentication?
    super && (self.is_deleted == "Nondeleted")
  end       

  has_many :forums, dependent: :destroy
  has_many :topics, dependent: :destroy
  has_many :recommendations, dependent: :destroy
  has_many :favorites , dependent: :destroy
  
end
