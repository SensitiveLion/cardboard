class AddAmazonHtmlToGames < ActiveRecord::Migration
  def change
    add_column :games, :amazon_html, :string
  end
end
