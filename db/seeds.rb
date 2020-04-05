Category.create(
  [
    {
      name: "意匠設計"
    },
    {
      name: "構造設計"
    },
    {
      name: "施工管理"
    },
    {
      name: "設備環境"
    },
    {
      name: "建築法規"
    },
    {
      name: "資格"
    },
    {
      name: "その他"
    },
  ]
)

User.create(
  [
    {
      nickname: "トランプ",
      email:    'aaa@aaa',
      password: 'abcd123',
      password_confirmation: "abcd123",
      image: open("./app/assets/images/test/image1.png")
    },
    {
      nickname: "BB8",
      email:    'bbb@bbb',
      password: 'abcd123',
      password_confirmation: "abcd123",
      image: open("./app/assets/images/test/image2.png")
    },
    {
      nickname: "ドクター",
      email:    'ccc@ccc',
      password: 'abcd123',
      password_confirmation: "abcd123",
      image: open("./app/assets/images/test/image3.png")
    },
    {
      nickname: "ケロックス",
      email:    'ddd@ddd',
      password: 'abcd123',
      password_confirmation: "abcd123",
      image: open("./app/assets/images/test/image4.png")
    },
    {
      nickname: "ケロックス",
      email:    'ddd@ddd',
      password: 'abcd123',
      password_confirmation: "abcd123",
      image: open("./app/assets/images/test/image4.png")
    },
    {
      nickname: "チキン",
      email:    'eee@eee',
      password: 'abcd123',
      password_confirmation: "abcd123",
      image: open("./app/assets/images/test/image5.png")
    },
    {
      nickname: "ミースケ",
      email:    'fff@fff',
      password: 'abcd123',
      password_confirmation: "abcd123",
      image: open("./app/assets/images/test/image6.png")
    },
  ]
)