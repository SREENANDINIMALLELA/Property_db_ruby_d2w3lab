require('pg')
class Property
  attr_accessor :number_of_bedrooms , :value , :year_build ,:build, :address
  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @number_of_bedrooms=options['number_of_bedrooms'].to_i()
    @value= options['value'].to_i()
    @year_build=options['year_build'].to_i()
    @build =options['build']
    @address = options['address']
  end
  def save()
    db = PG.connect({ dbname: 'property_search' , host: 'localhost'})
    sql = "INSERT INTO properties (
    number_of_bedrooms,value,year_build,build,address
    ) VALUES($1,$2,$3,$4,$5)RETURNING *"
    values =[@number_of_bedrooms,@value,@year_build,@build,@address]
    db.prepare("save",sql)
    @id=db.exec_prepared("save" , values)[0]['id'].to_i()
    db.close()

  end
  def update()
      db = PG.connect({ dbname: 'property_search' , host: 'localhost'})
      sql ="UPDATE properties SET (number_of_bedrooms,value,year_build,build,address)=($1,$2,$3,$4,$5)WHERE id=$6"
      values = [@number_of_bedrooms,@value,@year_build,@build,@address,@id]
        db.prepare("update",sql)
        db.exec_prepared("update" , values)
        db.close()
  end
  def delete()
      db = PG.connect({ dbname: 'property_search' , host: 'localhost'})
      sql ="DELETE FROM properties WHERE id =$1 "
      values=[@id]
      db.prepare("delete",sql)
      db.exec_prepared("delete", values)
      db.close()
  end
  def Property.delete_all()
    db = PG.connect({ dbname: 'property_search' , host: 'localhost'})
    sql ="DELETE FROM properties "
    db.prepare("delete_all",sql)
    db.exec_prepared("delete_all")
    db.close()

  end
  def Property.find(id)
    db = PG.connect({ dbname: 'property_search' , host: 'localhost'})
    sql ="SELECT * FROM properties WHERE id = $1 "
    values=[id]
    db.prepare("find",sql)
    properties=db.exec_prepared("find",values)
    db.close()
    return properties.map{|property| Property.new(property)};
  end



  def Property.find_by_address(address)
    db = PG.connect({ dbname: 'property_search' , host: 'localhost'})
    sql ="SELECT * FROM properties WHERE address = $1"
    values = [address]
    db.prepare("find_by_address",sql)
    property_by_address=db.exec_prepared("find_by_address",values)
    db.close()
    properties_found = property_by_address.map{|property| Property.new(property)};
    if properties_found.length() != 0
      return properties_found
    else
      return nil
    end
    <===========>
    # return nil if property_by_address.first() == nil
    # property_hash=property_by_address[0]
    # found_property =Property.new(property_hash)
    # return found_property
  end
end
