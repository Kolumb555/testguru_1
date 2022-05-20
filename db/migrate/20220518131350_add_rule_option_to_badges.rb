class AddRuleOptionToBadges < ActiveRecord::Migration[6.1]
  def change
    add_column :badges, :rule_option, :string
  end
end
