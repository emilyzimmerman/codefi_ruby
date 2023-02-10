class Student < ApplicationRecord
    has_many :schedules
    has_many :courses, :through => :schedules
end
