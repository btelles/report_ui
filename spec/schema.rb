
ActiveRecord::Schema.define(:version => 0) do
  create_table :people, :force => true do |t|
    t.column :name, :string
    t.column :date_of_birth, :date
    t.column :amount, :decimal, :precision => 10, :scale => 2
  end

  create_table :articles, :force => true do |t|
    t.column :title, :string
    t.column :content, :string
  end
end
