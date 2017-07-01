require 'active_record'
require 'pg' # postgresql

ActiveRecord::Base.establish_connection(
  adapter: "postgresql",
  encoding: "unicode",
  database: "test",
  username: "",
  password: ""
)

class User < ActiveRecord::Base
end