class User < ApplicationRecord
  has_one :wallet, as: :attachable
end
