namespace :dummy do
  desc "TODO"
  task insert: :environment do
    Book.delete_all
    User.delete_all
    Kashidashi.delete_all
    Book.create(
      isbn: "978-4797372274",
      name:"たのしいRuby 第4版",
      author: "高橋征義,後藤裕蔵",
      publisher: "ソフトバンククリエイティブ",
      published_date: "2013/6/4"
    )
    User.create(
      id: "10jk999@ms.dendai.ac.jp",
      name: "電大太郎"
    )
    Kashidashi.create(
      isbn: "978-4797372274",
      user_id: "10jk999@ms.dendai.ac.jp"
    )
  end

end
