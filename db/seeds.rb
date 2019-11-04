# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
lady = Category.create(name: "レディース")
mens = Category.create(name: "メンズ")
baby_kids = Category.create(name: "ベビー・キッズ")
interior_dwelling_accessory = Category.create(name: "インテリア・住まい・小物")
book_music_game = Category.create(name: "本・音楽・ゲーム")
toy_hobby_goods = Category.create(name: "おもちゃ・ホビー・グッズ")
cosme_perfume_beauty = Category.create(name: "コスメ・香水・美容")
electronics_smartphone_camera = Category.create(name: "家電・スマホ・カメラ")
sports_lisure = Category.create(name: "スポーツ・レジャー")
handmade = Category.create(name: "ハンドメイド")
ticket = Category.create(name: "チケット")
bicycle_bike = Category.create(name: "自転車・オートバイ")
etc = Category.create(name: "その他")


lady_tops = lady.children.create(name: "トップス")
lady_jacket = lady.children.create(name: "ジャケット/アウター")
lady_pants = lady.children.create(name: "パンツ")
lady_skart = lady.children.create(name: "スカート")
lady_onepiece = lady.children.create(name: "ワンピース")
lady_shoues = lady.children.create(name: "靴")
lady_roomwear = lady.children.create(name: "ルームウェア/パジャマ")
lady_regwea = lady.children.create(name: "レッグウェア")
lady_cap = lady.children.create(name: "帽子")
lady_bag = lady.children.create(name: "バッグ")
lady_accesary = lady.children.create(name: "アクセサリー")
lady_hairaccesary = lady.children.create(name: "ヘアアクセサリー")
lady_zakka = lady.children.create(name: "小物")
lady_clock = lady.children.create(name: "時計")
wig_extension = lady.children.create(name: "ウィッグ/エクステ")
lady_yukata_swimsuit = lady.children.create(name: "浴衣/水着")
lady_suit_formal_dress = lady.children.create(name: "スーツ/フォーマル/ドレス")
maternity = lady.children.create(name: "マタニティ")
lady_etc = lady.children.create(name: "その他")


lady_tops.children.create(
  [
    {name: "Tシャツ/カットソー(半袖/袖なし)"},
    {name: "Tシャツ/カットソー(七分/長袖)"},
    {name: "シャツ/ブラウス(半袖/袖なし)"},
    {name: "シャツ/ブラウス(七分/長袖)"},
    {name: "ポロシャツ"},
    {name: "キャミソール"},
    {name: "タンクトップ"},
    {name: "ホルターネック"},
    {name: "ニット/セーター"},
    {name: "チュニック"},
    {name: "カーディガン/ボレロ"},
    {name: "アンサンブル"},
    {name: "ベスト/ジレ"},
    {name: "パーカー"},
    {name: "トレーナー/スウェット"},
    {name: "ベアトップ/チューブトップ"},
    {name: "ジャージ"},
    {name: "その他"}
  ]
)
lady_jacket.children.create(
  [
    {name: "テーラードジャケット"},
    {name: "ノーカラージャケット"},
    {name: "Gジャン/デニムジャケット"},
    {name: "レザージャケット"},
    {name: "ダウンジャケット"},
    {name: "ライダースジャケット"},
    {name: "ミリタリージャケット"},
    {name: "ダウンベスト"},
    {name: "ジャンパー/ブルゾン"},
    {name: "ポンチョ"},
    {name: "ロングコート"},
    {name: "トレンチコート"},
    {name: "ダッフルコート"},
    {name: "ピーコート"},
    {name: "チェスターコート"},
    {name: "モッズコート"},
    {name: "スタジャン"},
    {name: "毛皮/ファーコート"},
    {name: "スプリングコート"},
    {name: "スカジャン"},
    {name: "その他"}
  ]
)
lady_pants.children.create(
  [
    {name: "デニム/ジーンズ"},
    {name: "ショートパンツ"},
    {name: "カジュアルパンツ"},
    {name: "ハーフパンツ"},
    {name: "チノパン"},
    {name: "ワークパンツ/カーゴパンツ"},
    {name: "クロップドパンツ"},
    {name: "サロペット/オーバーオール"},
    {name: "オールインワン"},
    {name: "サルエルパンツ"},
    {name: "ガウチョパンツ"},
    {name: "その他"}
  ]
)
lady_skart.children.create(
  [
    {name: "ミニスカート"},
    {name: "ひざ丈スカート"},
    {name: "ロングスカート"},
    {name: "キュロット"},
    {name: "その他"}
  ]
)
lady_onepiece.children.create(
  [
    {name: "ミニワンピース"},
    {name: "ひざ丈ワンピース"},
    {name: "ロングワンピース"},
    {name: "その他"}
  ]
)
lady_shoues.children.create(
  [
    {name: "ハイヒール/パンプス"},
    {name: "ブーツ"},
    {name: "サンダル"},
    {name: "スニーカー"},
    {name: "ミュール"},
    {name: "モカシン"},
    {name: "ローファー/革靴"},
    {name: "フラットシューズ/バレエシューズ"},
    {name: "長靴/レインシューズ"},
    {name: "その他"}
  ]
)
lady_roomwear.children.create(
  [
    {name: "パジャマ"},
    {name: "ルームウェア"}
  ]
)
lady_regwea.children.create(
  [
    {name: "ソックス"},
    {name: "スパッツ/レギンス"},
    {name: "ストッキング/タイツ"},
    {name: "レッグウォーマー"},
    {name: "その他"}
  ]
)
lady_cap.children.create(
  [
    {name: "ニットキャップ/ビーニー"},
    {name: "ハット"},
    {name: "ハンチング/ベレー帽"},
    {name: "キャップ"},
    {name: "キャスケット"},
    {name: "麦わら帽子"},
    {name: "その他"}
  ]
)
lady_bag.children.create(
  [
    {name: "ハンドバッグ"},
    {name: "トートバッグ"},
    {name: "エコバッグ"},
    {name: "リュック/バックパック"},
    {name: "ボストンバッグ"},
    {name: "スポーツバッグ"},
    {name: "ショルダーバッグ"},
    {name: "クラッチバッグ"},
    {name: "ポーチ/バニティ"},
    {name: "ボディバッグ/ウェストバッグ"},
    {name: "マザーズバッグ"},
    {name: "メッセンジャーバッグ"},
    {name: "ビジネスバッグ"},
    {name: "旅行用バッグ/キャリーバッグ"},
    {name: "ショップ袋"},
    {name: "和装用バッグ"},
    {name: "かごバッグ"},
    {name: "その他"}
  ]
)
lady_accesary.children.create(
  [
    {name: "ネックレス"},
    {name: "ブレスレット"},
    {name: "バングル/リストバンド"},
    {name: "リング"},
    {name: "ピアス(片耳用)"},
    {name: "ピアス(両耳用)"},
    {name: "イヤリング"},
    {name: "アンクレット"},
    {name: "ブローチ/コサージュ"},
    {name: "チャーム"},
    {name: "その他"}
  ]
)
lady_hairaccesary.children.create(
  [
    {name: "ヘアゴム/シュシュ"},
    {name: "ヘアバンド/カチューシャ"},
    {name: "ヘアピン"},
    {name: "その他"}
  ]
)
lady_zakka.children.create(
  [
    {name: "長財布"},
    {name: "折り財布"},
    {name: "コインケース/小銭入れ"},
    {name: "名刺入れ/定期入れ"},
    {name: "キーケース"},
    {name: "キーホルダー"},
    {name: "手袋/アームカバー"},
    {name: "ハンカチ"},
    {name: "ベルト"},
    {name: "マフラー/ショール"},
    {name: "ストール/スヌード"},
    {name: "バンダナ/スカーフ"},
    {name: "ネックウォーマー"},
    {name: "サスペンダー"},
    {name: "サングラス/メガネ"},
    {name: "モバイルケース/カバー"},
    {name: "手帳"},
    {name: "イヤマフラー"},
    {name: "傘"},
    {name: "レインコート/ポンチョ"},
    {name: "ミラー"},
    {name: "タバコグッズ"},
    {name: "その他"}
  ]
)
lady_clock.children.create(
  [
    {name: "腕時計(アナログ)"},
    {name: "腕時計(デジタル)"},
    {name: "ラバーベルト"},
    {name: "レザーベルト"},
    {name: "金属ベルト"},
    {name: "その他"}
  ]
)
wig_extension.children.create(
  [
    {name: "前髪ウィッグ"},
    {name: "ロングストレート"},
    {name: "ロングカール"},
    {name: "ショートストレート"},
    {name: "ショートカール"},
    {name: "その他"}
  ]
)
lady_yukata_swimsuit.children.create(
  [
    {name: "浴衣"},
    {name: "着物"},
    {name: "振袖"},
    {name: "長襦袢/半襦袢"},
    {name: "水着セパレート"},
    {name: "水着ワンピース"},
    {name: "水着スポーツ用"},
    {name: "その他"}
  ]
)
lady_suit_formal_dress.children.create(
  [
    {name: "スカートスーツ上下"},
    {name: "パンツスーツ上下"},
    {name: "ドレス"},
    {name: "パーティーバッグ"},
    {name: "シューズ"},
    {name: "ウェディング"},
    {name: "その他"}
  ]
)
maternity.children.create(
  [
    {name: "トップス"},
    {name: "アウター"},
    {name: "インナー"},
    {name: "ワンピース"},
    {name: "パンツ/スパッツ"},
    {name: "スカート"},
    {name: "パジャマ"},
    {name: "授乳服"},
    {name: "その他"}
  ]
)
lady_etc.children.create(
  [
    {name: "コスプレ"},
    {name: "下着"},
    {name: "その他"}
  ]
)

book = book_music_game.children.create(name: "本")

book.children.create(
  [
    {name: "文学/小説"},
    {name: "人文/社会"},
    {name: "ノンフィクション/教養"}
  ]
)





