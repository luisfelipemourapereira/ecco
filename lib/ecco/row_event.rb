module Ecco
  RowEvent = Struct.new *%i[
    database
    table_id
    table
    type
    rows
    data
  ]
end
