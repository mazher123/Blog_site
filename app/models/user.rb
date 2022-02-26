class User < ApplicationRecord

    validates :name, presence: true, length: { minimum: 6 ,maximum: 100}
    validates :email, presence:true, length: { minimum:10 ,maximum: 300}
    validates :password , presence:true ,length: { minimum:4 , maximum:30}
    validates :image, presence:false 
end
