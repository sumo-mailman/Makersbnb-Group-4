def persisted_data(id)
  connection = PG.connect(dbname: 'makersbnb_test')
  result = connection.query("SELECT * FROM users WHERE id = #{id};")
end