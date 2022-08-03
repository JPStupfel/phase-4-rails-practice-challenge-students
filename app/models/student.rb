class Student < ApplicationRecord
    belongs_to :instructor

    validates :name, presence: true
    validates :age, inclusion: {in:0..18}

end
