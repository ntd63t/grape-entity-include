class UserEntity < Grape::Entity
  expose :name
  expose :email
  expose :friends, using: UserEntity, if: include_attr_path?
  expose :posts, using: PostEntity, if: include_attr_path?
  expose :profile, using: ProfileEntity, if: include_attr_path?
end