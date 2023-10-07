# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Admin.find_or_create_by!(email: ENV["ADMIN_EMAIL"]) do |admin|
  admin.password = ENV["ADMIN_PASSWORD"]
end

olivia = Member.find_or_create_by!(email: "olivia@example.com") do |member|
  member.name = "オリビア"
  member.password = ENV["MEMBER_PASSWORD"]
  member.introduction = "愛猫はスコティッシュフォールドの太郎くんです！太郎くんとの日常を投稿しています！"
  member.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-member3.jpg"), filename:"sample-member1.jpg")
end

james = Member.find_or_create_by!(email: "james@example.com") do |member|
  member.name = "ジェームズ"
  member.password = ENV["MEMBER_PASSWORD"]
  member.introduction = "愛猫はマンチカンのマリンちゃんです！マリンちゃんとの日常を投稿しています！"
  member.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-member1.jpg"), filename:"sample-member2.jpg")
end

lucas = Member.find_or_create_by!(email: "lucas@example.com") do |member|
  member.name = "ルークス"
  member.password = ENV["MEMBER_PASSWORD"]
  member.introduction = "愛猫はアメリカンショートヘアーのタマです！仲良くしてください！"
  member.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-member2.jpg"), filename:"sample-member3.jpg")
end

Blog.find_or_create_by!(title: "今日の食事") do |blog|
  blog.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-blog1.jpg"), filename:"sample-blog1.jpg")
  blog.body = "仲良く食事していました！"
  blog.status = 0
  blog.member = olivia
end

Blog.find_or_create_by!(title: "お散歩に行ってきました！") do |blog|
  blog.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-blog2.jpg"), filename:"sample-blog2.jpg")
  blog.body = "天気が良くて猫ちゃんも幸せそうでした！"
  blog.status = 0
  blog.member = james
end

Blog.find_or_create_by!(title: "大嫌いな病院") do |blog|
  blog.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-blog3.jpg"), filename:"sample-blog3.jpg")
  blog.body = "大嫌いな病院に頑張って行っていきました！お利口さん！"
  blog.status = 0
  blog.member = lucas
end

breed_names = [
  "ミックス",
  "スコティッシュフォールド",
  "マンチカン",
  "アメリカンショートヘア",
  "ラグドール",
  "ブリティッシュショートヘア",
  "ノルウェージャンフォレストキャット",
  "サイベリアン",
  "ロシアンブルー",
  "ベンガル"
]

breed_names.each do |name|
  Breed.create!(name: name)
end


Cat.find_or_create_by!(name: "太郎") do |cat|
  cat.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-cat1.jpg"), filename:"sample-cat1.jpg")
  cat.breed = Breed.find_by(name: "スコティッシュフォールド")
  cat.introduction = "人見知りの男の子です！"
  cat.birthday = Date.new(2021, 12, 1)
  cat.family_join_day = Date.new(2021, 2, 5)
  cat.weight = 6
  cat.ideal_weight = 5
  cat.sex = 0
  cat.member = olivia
end

Cat.find_or_create_by!(name: "マリン") do |cat|
  cat.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-cat2.jpg"), filename:"sample-cat2.jpg")
  cat.breed = Breed.find_by(name: "マンチカン")
  cat.introduction = "おてんばな女の子です！"
  cat.birthday = Date.new(2022, 8, 4)
  cat.family_join_day = Date.new(2022, 9, 15)
  cat.weight = 7.4
  cat.ideal_weight = 6.3
  cat.sex = 1
  cat.member = james
end

Cat.find_or_create_by!(name: "タマ") do |cat|
  cat.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-cat3.jpg"), filename:"sample-cat3.jpg")
  cat.breed = Breed.find_by(name: "アメリカンショートヘア")
  cat.introduction = "寝ることが大好きです！"
  cat.sex = 0
  cat.birthday = Date.new(2023, 3, 19)
  cat.family_join_day = Date.new(2023, 7, 21)
  cat.weight = 4
  cat.ideal_weight = 3.2
  cat.member = lucas
end

Community.find_or_create_by!(title: "ブリちゃん同好会") do |community|
  community.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-community1.jpg"), filename:"sample-community1.jpg")
  community.body = "このコミュニティは、愛らしいさと知性あるこの猫種を愛する人々のための場所です。猫の飼育、健康、トリビアについての情報を共有し、仲間とのつながりを楽しみましょう。"
end

Community.find_or_create_by!(title: "スコティッシュ研究所") do |community|
  community.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-community2.jpg"), filename:"sample-community2.jpg")
  community.body = "このコミュニティは、スコティッシュフォールドを愛し、共有する場所です。健康ケアや楽しいエピソードの共有、ファン同士の交流をお楽しみください。"
end

Community.find_or_create_by!(title: "マンチカンの里") do |community|
  community.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-community3.jpg"), filename:"sample-community3.jpg")
  community.body = "このコミュニティは、短足で愛らしいマンチカン猫のファンが集まる場所です。飼育アドバイスやカウンセリングの瞬間の共有、仲間との交流をお楽しみください。"
end

Topic.find_or_create_by!(title: "このおもちゃがおすすめです！") do |topic|
  topic.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-topic1.jpg"), filename:"sample-topic1.jpg")
  topic.body = "猫じゃらしのおもちゃでずーっと遊んでいます！"
  topic.community = Community.find_by(title: "ブリちゃん同好会")
end

Topic.find_or_create_by!(title: "このフードがおすすめです！") do |topic|
  topic.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-topic2.jpg"), filename:"sample-topic2.jpg")
  topic.body = "このフードに変えてから減量に成功しました！"
  topic.community = Community.find_by(title: "スコティッシュ研究所")
end

Topic.find_or_create_by!(title: "やっぱりチュールはまぐろ味!") do |topic|
  topic.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-topic2.jpg"), filename:"sample-topic2.jpg")
  topic.body = "みなさんのおすすめのおやつはありますか？"
  topic.community = Community.find_by(title: "マンチカンの里")
end