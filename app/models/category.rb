class Category < ApplicationRecord
    validates :name, presence: true, length: { minimum: 6 ,maximum: 40}
    validates :type, presence:true, length: { minimum:10 ,maximum: 300}
   
end
