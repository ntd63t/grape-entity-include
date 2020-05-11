require_relative 'comment_entity'
require_relative 'photo_entity'

class PostEntity < Grape::Entity
  expose :title
  expose :content
  expose :comments, using: CommentEntity, if: include_attr_path?
  expose :photos, using: PhotoEntity, if: include_attr_path?
end