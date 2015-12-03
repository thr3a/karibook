namespace :dummy do
  desc "TODO"
  task insert: :environment do
    Book.delete_all
    User.delete_all
    Kashidashi.delete_all
    Book.create(
      isbn: "9784797372274",
      name:"たのしいRuby 第4版",
      author: "高橋 征義",
      publisher: "SBクリエイティブ",
      published_date: "2013/6/4"
    )
    Book.create(
      isbn: "9784832245464",
      name:"ＮＥＷ　ＧＡＭＥ！　２巻 (まんがタイムKRコミックス)",
      author: "得能 正太郎",
      publisher: "芳文社",
      published_date: "2015/3/27"
    )
    Book.create(
      isbn: "9784797371598",
      name:"みんなのPython 第3版",
      author: "柴田 淳",
      publisher: "ソフトバンククリエイティブ",
      published_date: "2012/8/29"
    )
    Book.create(
      isbn: "9784894715370",
      name:"モダン オペレーティング システム 原書 第2版",
      author: "Andrew S.Tanenbaum",
      publisher: "ピアソン・エデュケーション・ジャパン",
      published_date: "2004/12/7"
    )
    User.create(
      id: "10jk001",
      name: "電大太郎"
    )
    User.create(
      id: "10jk002",
      name: "電大花子"
    )
    Kashidashi.create(
      isbn: "9784797372274",
      user_id: "10jk001"
    )
  end

end
