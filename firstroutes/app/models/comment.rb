class Comment < ApplicationRecord

    validates :commenter_id, :artwork_id, :text, presence: true
    has_many :likes, as: :likeable

    belongs_to :commenter,
        foreign_key: :commenter_id,
        class_name: :User

    belongs_to :artwork,
        foreign_key: :artwork_id,
        class_name: :Artwork

    # has_many :likes,
    #     foreign_key: :comment_id,
    #     class_name: :Like

end