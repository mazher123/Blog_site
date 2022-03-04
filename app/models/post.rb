class Post < ApplicationRecord
    belongs_to :user  ,optional: true 
    belongs_to :category, optional: true
    has_one_attached :image

    validates :title, presence: true, length: { minimum: 6 ,maximum: 100}
    validates :content, presence:true, length: { minimum: 10 ,maximum: 15000}
    validates :author , presence:true ,length: { minimum: 4 , maximum: 30}
    validates :image, presence: true, blob: { content_type: ['image/jpg', 'image/jpeg', 'image/png'],
         size_range: 1..10.megabytes }
end
