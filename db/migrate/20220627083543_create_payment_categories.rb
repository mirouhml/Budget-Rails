class CreatePaymentCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_categories do |t|
      t.references :payment, null: false, foreign_key: true, column: :payment_id
      t.references :category, null: false, foreign_key: true, column: :category_id

      t.timestamps
    end
  end
end
