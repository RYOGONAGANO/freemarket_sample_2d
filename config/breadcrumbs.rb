crumb :root do
  link 'メルカリ', root_path
end

crumb :user_show do
  link "マイページ", users_path
  parent :root
end

crumb :users_logout do
  link "ログアウト", logout_users_path
  parent :user_show
end

crumb :users_profilechange do
  link "本人情報の登録", profilechange_users_path
  parent :user_show
end

crumb :cards_index do
  link "支払い方法", cards_path
  parent :user_show
end

crumb :users_profile do
  link "プロフィール", profile_users_path
  parent :user_show
end

crumb :products_name do |product|
  link product.name
  parent :root
end

crumb :saling_products do |product|
  link "出品した商品 - 出品中", user_saling_products_path(current_user.id)
  parent :user_show
end

crumb :soldout_products do |product|
  link "出品した商品 - 売却済み", user_soldout_products_path(current_user.id)
  parent :user_show
end