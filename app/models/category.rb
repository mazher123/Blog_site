class Category < ApplicationRecord

    before_save { 
        if self.is_active == "active" 
            self.is_active = 1
            
        else
            self.is_active = 0 
        end
    }
    has_many :post, dependent: :nullify
    validates :name, presence: true, length: { minimum: 6 ,maximum: 40}

    validates :is_active, presence:true, length: { minimum:6 ,maximum: 300}
   
end
