class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string      :name
      t.text        :text
      t.text        :image
      t.timestamps  null:true  #日時など、デフォルトでnullが許可されている,許可しない場合、null:faulse
    end
  end
end
