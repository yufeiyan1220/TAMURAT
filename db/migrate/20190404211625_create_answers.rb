class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.integer :company_id, unique: true
      t.integer :question_id, null: false
      t.string :level, default: "NA"
      t.boolean :validated, default: false
      t.integer :validator_id
      t.string :validator_comment

      t.timestamps
    end
  end
end
