bundle install
=> Should install a bunch of ruby gems

sudo service postgresql start

psql =>  to test it's working

\q to quit postgres

If it prompts you for a name and password, do NOT type one in.  Press ENTER to continue.


```
 $ rake
 =>
rake:db migrate: Will run migrations
rake:db create: Will create a database
rake:db drop: Will drop the database
rake:db reset: Will reset the database
rake g:migration: Will create a migration
```

$ rake db:create

$ rake g:migration create_users


```
# db/migrate/...create_users.rb

class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :salutation
 
      t.timestamps
    end
  end
end
```

$ irb            
2.3.1 :001 > require './app.rb'
 => true 
2.3.1 :002 > User.new
 => #<User id: nil, name: nil, salutation: nil, created_at: nil, updated_at: nil> 
2.3.1 :003 > exit

