# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
lady = Category.create(name: "レディース")
mens = Category.create(name: "メンズ")
# baby_kids = Category.create(name: "ベビー・キッズ")
# interior_dwelling_accessory = Category.create(name: "インテリア・住まい・小物")
book_music_game = Category.create(name: "本・音楽・ゲーム")
# toy_hobby_goods = Category.create(name: "おもちゃ・ホビー・グッズ")
# cosme_perfume_beauty = Category.create(name: "コスメ・香水・美容")
# electronics_smartphone_camera = Category.create(name: "家電・スマホ・カメラ")
# sports_lisure = Category.create(name: "スポーツ・レジャー")
# handmade = Category.create(name: "ハンドメイド")
# ticket = Category.create(name: "チケット")
# bicycle_bike = Category.create(name: "自転車・オートバイ")
# etc = Category.create(name: "その他")


lady_tops = lady.children.create(name: "トップス")
lady_jacket = lady.children.create(name: "ジャケット/アウター")
lady_pants = lady.children.create(name: "パンツ")
lady_skart = lady.children.create(name: "スカート")
lady_onepiece = lady.children.create(name: "ワンピース")
lady_shoues = lady.children.create(name: "靴")
lady_roomwear = lady.children.create(name: "ルームウェア/パジャマ")
lady_legwea = lady.children.create(name: "レッグウェア")
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
lady_legwea.children.create(
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

mens_tops = mens.children.create(name: "トップス")
mens_jacket = mens.children.create(name: "ジャケット/アウター")
mens_pants = mens.children.create(name: "パンツ")
mens_shoues = mens.children.create(name: "靴")
mens_bag = mens.children.create(name: "バッグ")
mens_suit = mens.children.create(name: "スーツ")
mens_cap = mens.children.create(name: "帽子")
mens_accesary = mens.children.create(name: "アクセサリー")
mens_zakka = mens.children.create(name: "小物")
mens_clock = mens.children.create(name: "時計")
mens_swimsuit = mens.children.create(name: "水着")
mens_legwear = mens.children.create(name: "レッグウェア")
mens_underwear = mens.children.create(name: "アンダーウェア")
mens_etc = mens.children.create(name: "その他")

mens_tops.children.create(
  [
    {name: "Tシャツ/カットソー(半袖/袖なし)"},
    {name: "Tシャツ/カットソー(七分/長袖)"},
    {name: "シャツ"},
    {name: "ポロシャツ"},
    {name: "タンクトップ"},
    {name: "ニット/セーター"},
    {name: "パーカー"},
    {name: "カーディガン"},
    {name: "スウェット"},
    {name: "ジャージ"},
    {name: "ベスト"},
    {name: "その他"}
  ]
)
mens_jacket.children.create(
  [
    {name: "テーラードジャケット"},
    {name: "ノーカラージャケット"},
    {name: "Gジャン/デニムジャケット"},
    {name: "レザージャケット"},
    {name: "ダウンジャケット"},
    {name: "ライダースジャケット"},
    {name: "ミリタリージャケット"},
    {name: "ナイロンジャケット"},
    {name: "フライトジャケット"},
    {name: "ピーコート"},
    {name: "ステンカラーコート"},
    {name: "トレンチコート"},
    {name: "モッズコート"}
  ]
)
mens_pants.children.create(
  [
    {name: "デニム/ジーンズ"},
    {name: "ワークパンツ/カーゴパンツ"},
    {name: "スラックス"},
    {name: "チノパン"},
    {name: "ショートパンツ"},
    {name: "ペインターパンツ"},
    {name: "サルエルパンツ"},
    {name: "オーバーオール"},
    {name: "その他"}
  ]
)
mens_shoues.children.create(
  [
    {name: "スニーカー"},
    {name: "サンダル"},
    {name: "ブーツ"},
    {name: "モカシン"},
    {name: "ドレス/ビジネス"},
    {name: "長靴/レインシューズ"},
    {name: "デッキシューズ"},
    {name: "その他"}
  ]
)
mens_bag.children.create(
  [
    {name: "ショルダーバッグ"},
    {name: "トートバッグ"},
    {name: "ボストンバッグ"},
    {name: "リュック/バックパック"},
    {name: "ウエストポーチ"},
    {name: "ボディバッグ"},
    {name: "ドラムバッグ"},
    {name: "ビジネスバッグ"},
    {name: "トラベルバッグ"},
    {name: "メッセンジャーバッグ"},
    {name: "エコバッグ"},
    {name: "その他"}
  ]
)
mens_suit.children.create(
  [
    {name: "スーツジャケット"},
    {name: "スーツベスト"},
    {name: "スラックス"},
    {name: "セットアップ"},
    {name: "その他"}
  ]
)
mens_cap.children.create(
  [
    {name: "キャップ"},
    {name: "ハット"},
    {name: "ニットキャップ/ビーニー"},
    {name: "ハンチング/ベレー帽"},
    {name: "キャスケット"},
    {name: "サンバイザー"},
    {name: "その他"}
  ]
)
mens_accesary.children.create(
  [
    {name: "ネックレス"},
    {name: "ブレスレット"},
    {name: "バングル/リストバンド"},
    {name: "リング"},
    {name: "ピアス(片耳用)"},
    {name: "ピアス(両耳用)"},
    {name: "アンクレット"},
    {name: "その他"}
  ]
)
mens_zakka.children.create(
  [
    {name: "長財布"},
    {name: "折り財布"},
    {name: "マネークリップ"},
    {name: "コインケース/小銭入れ"},
    {name: "名刺入れ/定期入れ"},
    {name: "キーケース"},
    {name: "キーホルダー"},
    {name: "ネクタイ"},
    {name: "手袋"},
    {name: "ハンカチ"},
    {name: "ベルト"},
    {name: "マフラー"},
    {name: "ストール"},
    {name: "バンダナ"}
  ]
)
mens_clock.children.create(
  [
    {name: "腕時計(アナログ)"},
    {name: "腕時計(デジタル)"},
    {name: "ラバーベルト"},
    {name: "レザーベルト"},
    {name: "金属ベルト"},
    {name: "その他"}
  ]
)
mens_swimsuit.children.create(
  [
    {name: "一般水着"},
    {name: "スポーツ用"},
    {name: "アクセサリー"},
    {name: "その他"}
  ]
)
mens_legwea.children.create(
  [
    {name: "ソックス"},
    {name: "レギンス/スパッツ"},
    {name: "レッグウォーマー"},
    {name: "その他"}
  ]
)
mens_underwear.children.create(
  [
    {name: "トランクス"},
    {name: "ボクサーパンツ"},
    {name: "その他"}
  ]
)
mens_etc.children.create(
  [
    {name: "その他"}
  ]
)

book = book_music_game.children.create(name: "本")
comic = book_music_game.children.create(name: "漫画")
magazine = book_music_game.children.create(name: "雑誌")
cd = book_music_game.children.create(name: "CD")
dvd_bluray = book_music_game.children.create(name: "DVD/ブルーレイ")
record = book_music_game.children.create(name: "レコード")
tvgame = book_music_game.children.create(name: "テレビゲーム")

book.children.create(
  [
    {name: "文学/小説"},
    {name: "人文/社会"},
    {name: "ノンフィクション/教養"},
    {name: "地図/旅行ガイド"},
    {name: "ビジネス/経済"},
    {name: "健康/医学"},
    {name: "コンピュータ/IT"},
    {name: "趣味/スポーツ/実用"},
    {name: "住まい/暮らし/子育て"},
    {name: "アート/エンタメ"},
    {name: "洋書"},
    {name: "絵本"},
    {name: "参考書"},
    {name: "その他"}
  ]
)
comic.children.create(
  [
    {name: "全巻セット"},
    {name: "少年漫画"},
    {name: "少女漫画"},
    {name: "青年漫画"},
    {name: "女性漫画"},
    {name: "同人誌"},
    {name: "その他"}
  ]
)
magazine.children.create(
  [
    {name: "アート/エンタメ/ホビー"},
    {name: "ファッション"},
    {name: "ニュース/総合"},
    {name: "趣味/スポーツ"},
    {name: "その他"}
  ]
)
cd.children.create(
  [
    {name: "邦楽"},
    {name: "洋楽"},
    {name: "アニメ"},
    {name: "クラシック"},
    {name: "K-POP/アジア"},
    {name: "キッズ/ファミリー"},
    {name: "その他"}
  ]
)
dvd_bluray.children.create(
  [
    {name: "日本映画"},
    {name: "外国映画"},
    {name: "アニメ"},
    {name: "TVドラマ"},
    {name: "ミュージック"},
    {name: "お笑い/バラエティ"},
    {name: "スポーツ/フィットネス"},
    {name: "キッズ/ファミリー"},
    {name: "その他"}
  ]
)
record.children.create(
  [
    {name: "邦楽"},
    {name: "洋楽"},
    {name: "その他"}
  ]
)
tvgame.children.create(
  [
    {name: "家庭用ゲーム本体"},
    {name: "家庭用ゲームソフト"},
    {name: "携帯用ゲーム本体"},
    {name: "携帯用ゲームソフト"},
    {name: "PCゲーム"},
    {name: "その他"}
  ]
)



