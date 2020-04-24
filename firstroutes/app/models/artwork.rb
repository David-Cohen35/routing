class Artwork < ApplicationRecord
    validates :artist_id, uniqueness: {scope: :title}
    
    # has_many :comments, dependent: :destroy
    has_many :likes, as: :likeable

    belongs_to(:user,
        foreign_key: :artist_id,
        primary_key: :id,
        class_name: :User)


    has_many(:shares,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare)
    

    has_many(:shared_viewers,
        through: :shares,
        source: :viewer)

    has_many(:comments,
        foreign_key: :artwork_id,
        class_name: :Comment, dependent: :destroy)

    # has_many :likes,
    #     foreign_key: :artwork_id,
    #     class_name: :Like
      
end