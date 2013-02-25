class CreateFactors < ActiveRecord::Migration
  def change
    create_table :factors do |t|
      t.string :name
      t.integer :effect

      t.timestamps
    end
	Factor.create name: 'budget', effect: 1
	Factor.create name: 'video', effect: 1
	Factor.create name: 'featured', effect:2
  end
end
