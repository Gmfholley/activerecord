```
 $ bundle install
```
=> Should install a bunch of ruby gems


On Cloud 9, start postgres services.
```
 $ sudo service postgresql start
```

Test postgres is working.

```
 $ psql
 postgres=#
```

`\q` quits postgres.



Test that your gems are loaded correctly and rake tasks are available.
```
   $ rake
   =>
  rake db:create: Will create a database
  rake db:migrate: Will run migrations
  rake db:drop: Will drop the database
  rake db:reset: Will reset the database
  rake g:migration: Will create a migration
```


Set up postgres for Cloud9. (Only needs to happen once.)

```
  $ rake db:setupC9
```

Create your database.  (Only needs to happen once.)

```
  $ rake db:create
```

Create a migration (a change to the database structure).  We will start by creating a user's table.  The thing that comes after `migration` can be anything but needs to be in snake_case.

```
  $ rake g:migration create_users
```

An empty migration file is generated.
```
  # db/migrate/...create_users.rb

  class CreateUsers < ActiveRecord::Migration[5.0]
    def change
    end
  end
```

Now define the table.

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
Save and close.  (NEVER delete migration files.)

Run the migration. 
```
  $ rake db:migrate
```

Now let's load ruby and see if we can access our User table and insert the first record.
```
$ irb           
  2.3.1 :001 > require './app.rb'
   => true 
  2.3.1 :003 > a = User.new
   => #<User id: nil, name: nil, salutation: nil, created_at: nil, updated_at: nil> 
  2.3.1 :004 > a.name = 'Wendy Holley'
   => "Wendy Holley" 
  2.3.1 :005 > a.salutation = 'Wendy'
   => "Wendy" 
  2.3.1 :006 > a.save
   => true 
  2.3.1 :006 > exit
$
```
