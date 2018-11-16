class Teammate < ApplicationRecord
    belongs_to :team
    validates :team_id, :firstname, :lastname,:email, presence: true
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => [:create, :update]


end
