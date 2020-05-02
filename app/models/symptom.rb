class Symptom < ApplicationRecord
    validates :title, presence:true, uniqueness:true
    validates :content, presence:true
    validates :user_id, presence:true
    validates :main, presence:true
    belongs_to :user
end
