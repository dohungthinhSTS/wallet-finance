class Stock < ApplicationRecord
  has_one :wallet, as: :attachable
end
