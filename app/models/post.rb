class Post < ApplicationRecord
    resourcify
    include Authority::Abilities
    
  belongs_to :farm
end
