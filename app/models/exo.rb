class Exo < ApplicationRecord
    acts_as_list column: :position
    validates :name, :points, presence: true


    def name_points
        self[:name]+ ' - ' +self[:points].to_s
    end

end
