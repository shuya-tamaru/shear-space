![ShearSpace](https://user-images.githubusercontent.com/57956439/78367161-99c11e00-75fc-11ea-945c-b1450fe0031e.png)


<h1 align="center">ShearSpace</h1>
<br>
<p align="center">
<a>　</a>
<img src="https://user-images.githubusercontent.com/39142850/71774533-1ddf1780-2fb4-11ea-8560-753bed352838.png" width="70px;" />
<a>　</a>
<img src="https://user-images.githubusercontent.com/39142850/71774548-731b2900-2fb4-11ea-99ba-565546c5acb4.png" height="60px;" /><br><br>
<a>　</a><a>　</a>
<a><img src="https://user-images.githubusercontent.com/39142850/71774618-b32edb80-2fb5-11ea-9050-d5929a49e9a5.png" height="60px;" />
<a>　</a>
<a><img src="https://user-images.githubusercontent.com/39142850/71774644-115bbe80-2fb6-11ea-822c-568eabde5228.png" height="60px" />
<a>　</a>
<img src="https://user-images.githubusercontent.com/39142850/71774768-d064a980-2fb7-11ea-88ad-4562c59470ae.png" height="65px;" />
<a>　</a>
<a><img src="https://user-images.githubusercontent.com/39142850/71774786-37825e00-2fb8-11ea-8b90-bd652a58f1ad.png" height="60px;" />
</p><br>

# アプリケーション情報
## 概要
建設業界専用の技術ブログ投稿サイトを作成しました。

私自身、建設業界で６年程働きながらプログラミングを学習しました。プログラミング学習の過程で感じたことは、IT業界には知識や経験を、Qiita・StackOverflow・技術ブログ・SNS・GIthubなどでアウトプットをする習慣が根付いており、ググることでアウトプットされた情報が出てくるため、車輪の再発明をしなくて良い仕組みができています。
私自身、このようなアウトプットされた情報に助けられ、プログラミングの学習効率をあげることができました。

建設業界では、このようにアウトプットする習慣はまだ根付いているとは言えず、QiitaやStackOverflowなどのような場所ができ、多くの人たちが知識や経験をシェアすることで、より効率よく技術を学ぶことができるのではないか。そしてより業界が発展するのではないかと思い、今回のアプリを製作しました。

テーブル数も少なく、基本的なことの組み合わせで製作されており、各言語の基礎学習になりました。一方でAPIの使用にもチャレンジしたりもしました。
もっとシンプルに実装できたなとか、もっとリファクタリングできるなとか、反省点は多くありますが、一方で自分の課題も見えたことは収穫でした。
まだまだ機能としては不十分で、付け加えたい機能もありますが、製作を通して基礎から自分の課題まで学ぶことができたと思っております。

# DB design
![個人アプリ　ShearSpace](https://user-images.githubusercontent.com/57956439/78368926-5fa54b80-75ff-11ea-97eb-b9c42e72f776.png)

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, index: true|
|email|string|null: false, unique: true|
|password|string|null: false|
|image|string||

### Association
  - has_many :posts, dependent: :destroy
  - has_many :likes, dependent: :destroy
  - has_many :liked_posts, through: :likes, source: :post
  - has_many :comments
  - has_many :sns_credentials
​
## sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true|
|provider|string||
|uid|string||
### Association
- belongs_to :user
​
## postsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|content|text|null: false|
|category|references|null: false, index: true, foreign_key: true|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to  :category
- has_many :likes
- has_many :liked_users, through: :likes, source: :user
- has_many :images, dependent: :destroy

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :posts
​
## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|post|references|null: false, foreign_key: true|
### Association
- belongs_to :post

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|post|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :post

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|string|null: false|
|user|references|null: false, foreign_key: true|
|post|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :post
​
