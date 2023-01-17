class Membership < ApplicationRecord
    validates :gym_id, :client_id, :charge, presence: true
    validates :client_id, uniqueness: {scope: :gym_id, message: "Already has a membership to this gym"}

    belongs_to :gym
    belongs_to :client

end
