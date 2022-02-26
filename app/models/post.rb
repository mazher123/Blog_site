class Post < ApplicationRecord
    validates :title, presence: true, length: { minimum: 6 ,maximum: 100}
    validates :content, presence:true, length: { minimum:10 ,maximum: 300}
    validates :author , presence:true ,length: { minimum:4 , maximum:30}
    validates :image, presence:false 
end
