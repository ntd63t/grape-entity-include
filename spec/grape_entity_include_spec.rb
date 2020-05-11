RSpec.describe GrapeEntityInclude do
  it "has a version number" do
    expect(GrapeEntityInclude::VERSION).not_to be nil
  end

  context "#include_attr_path?" do
    let(:user) { double(attributes) }
    let(:attributes) do
      {
        name: 'Bob Bobson',
        email: 'bob@example.com',
        friends: [
          double(name: 'Friend 1', email: 'friend1@example.com', friends: []),
          double(name: 'Friend 2', email: 'friend2@example.com', friends: [])
        ],
        posts: [
          double(title: 'Post 1', content: 'Content post 1', comments: [{ content: 'Content comment 1' }, { content: 'Content comment 2' }], photos: [{ caption: 'Photo 1', url: 'photo url' }]),
          double(title: 'Post 2', content: 'Content post 2', comments: [{ content: 'Content comment 3' }, { content: 'Content comment 4' }], photos: [])
        ],
        profile: double(birthday: Time.gm(2012, 2, 27), hair_color: 'black', eyes_color: 'brown')
      }
    end
    let(:result) do
      result = attributes.dup
      result[:friends] = [
        { name: 'Friend 1', email: 'friend1@example.com', friends: [] },
        { name: 'Friend 2', email: 'friend2@example.com', friends: [] }
      ]
      result[:posts] = [
        { title: 'Post 1', content: 'Content post 1', comments: [{ content: 'Content comment 1' }, { content: 'Content comment 2' }], photos: [{ caption: 'Photo 1', url: 'photo url' }] },
        { title: 'Post 2', content: 'Content post 2', comments: [{ content: 'Content comment 3' }, { content: 'Content comment 4' }], photos: [] }
      ]
      result[:profile] = { birthday: Time.gm(2012, 2, 27), hair_color: 'black', eyes_color: 'brown' }
      result
    end
    it 'expose entity without options[:include]' do
      expect(UserEntity.represent(user).as_json).to eq(result.slice(:name, :email))
    end
    it 'expose entity with options[:include]' do
      include_opts = [
        :profile,
        { friends: [:friends] },
        { posts: [:comments, :photos] }
      ]
      expect(UserEntity.represent(user, include: include_opts).as_json).to eq(result)
    end
  end
end
