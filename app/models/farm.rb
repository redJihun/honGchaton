class Farm < ApplicationRecord
    rolify
    include Authority::UserAbilities
    has_one :user
    has_many :posts
end
