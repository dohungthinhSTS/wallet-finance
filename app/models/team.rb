class Team < ApplicationRecord
  has_one :wallet, as: :attachable
end
