# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

major_category_names = ["本", "コンピュータ", "ディスプレイ"]
book_categories = ["ビジネス", "文学・評論", "人文・思想", "スポーツ",
                    "コンピュータ・IT", "資格・検定・就職", "絵本・児童書", "写真集",
                    "ゲーム攻略本", "雑誌", "アート・デザイン", "ノンフィクション"]
computer_categories = ["ノートPC", "デスクトップPC", "タブレット"]
display_categories = ["19~20インチ", "デスクトップPC", "タブレット"]

major_category_names.each do |major_category_name|
  if major_category_name == "本"


    book_categories.each do |book_category|
      Category.create(
        name: book_category,
        description: book_category,
        major_category_name: major_category_name
      )
    end
  elsif major_category_name == "コンピュータ"
    computer_categories.each do |computer_category|
      Category.create(
        name: computer_category,
        description: computer_category,
        major_category_name: major_category_name
      )
    end
  elsif major_category_name == "ディスプレイ"
    display_categories.each do |display_category|
      Category.create(
        name: display_category,
        description: display_category,
        major_category_name: major_category_name
      )
    end
  end
end
