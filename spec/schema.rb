
ActiveRecord::Schema.define(:version => 1) do
  create_table :people, :force => true do |t|
    t.column :first_name, :string
    t.column :last_name, :string
    t.column :date_of_birth, :date
    t.column :amount, :decimal, :precision => 10, :scale => 2
  end

  create_table :articles, :force => true do |t|
    t.column :title, :string
    t.column :content, :string
  end

  create_table :reports, :force => true do |t|
    t.string :name
    t.string :description
    t.string :code
    t.string :cols
    t.string :includes
    t.string :sorts
    t.string :filters
  end
  create_table :temp_reports, :force => true do |t|
    t.column :name, :string
    t.column :query, :text
    t.column :language, :string
  end
end

