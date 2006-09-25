# This file is autogenerated. Instead of editing this file, please use the
# migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.

ActiveRecord::Schema.define(:version => 15) do

  create_table "authors", :force => true do |t|
    t.column "name", :string
    t.column "id_sbn", :string
  end

  create_table "contents", :force => true do |t|
    t.column "title", :string
    t.column "name", :string
    t.column "body", :text
    t.column "image", :string
  end

  create_table "documents", :force => true do |t|
    t.column "author_id", :integer
    t.column "id_sbn", :string
    t.column "insertion", :datetime
    t.column "version", :datetime
    t.column "language", :string
    t.column "title", :string
    t.column "title_without_article", :string
    t.column "subtitles", :string
    t.column "sub_responsibility", :string
    t.column "fingerprint", :string
    t.column "country_of_publication", :string
    t.column "place_of_publication", :string
    t.column "date_of_publication", :string
    t.column "publisher", :string
  end

  create_table "graduates", :force => true do |t|
    t.column "first_name", :string
    t.column "last_name", :string
    t.column "born_on", :date
    t.column "fiscal_code", :string, :limit => 16
    t.column "graduation_year", :integer
    t.column "home_page_url", :string
    t.column "email", :string
    t.column "address", :string
    t.column "phone", :string
    t.column "fax", :string
    t.column "mobile", :string
    t.column "agency", :string
    t.column "height_cm", :integer
    t.column "weight_kg", :integer
    t.column "eyes", :string
    t.column "hair", :string
    t.column "size", :integer
    t.column "sport", :string
    t.column "languages", :string
    t.column "dialects", :string
    t.column "notes", :string
    t.column "curriculum", :text
    t.column "image", :string
  end

  create_table "menu_items", :force => true do |t|
    t.column "parent_id", :integer
    t.column "title", :string
    t.column "controller", :string
    t.column "item_id", :integer
    t.column "position", :integer
  end

  create_table "news", :force => true do |t|
    t.column "title", :string
    t.column "body", :text
    t.column "created_at", :datetime
  end

  create_table "teachers", :force => true do |t|
    t.column "first_name", :string
    t.column "last_name", :string
    t.column "course_name", :string
    t.column "curriculum", :text
    t.column "for_seminar", :boolean
    t.column "image", :string
  end

end
