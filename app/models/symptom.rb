class Symptom < ApplicationRecord
    validates :title, presence:true, uniqueness:true
    validates :content, presence:true
    validates :user_id, presence:true
    validates :main, inclusion: { in: [ true, false ] }
    belongs_to :user
    paginates_per 5
end
