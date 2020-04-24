class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    has_many :artworks, dependent: :destroy
    has_many :artworks_shared, dependent: :destroy
    has_many :comments, dependent: :destroy

    has_many(:artworks, 
        foreign_key: :artist_id,
        primary_key: :id,
        class_name: :Artwork)
        

    has_many(:artworks_shared,
        foreign_key: :viewer_id,
        class_name: :ArtworkShares)
    

    has_many(:shared_artworks,
        through: :artworks_shared,
        source: :artwork)

    has_many(:comments,
        foreign_key: :commenter_id,
        class_name: :Comment)

    has_many(:likes,
        foreign_key: :user_id,
        class_name: :Like)

end