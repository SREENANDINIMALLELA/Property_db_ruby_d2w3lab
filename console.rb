require ('pry')
require_relative('./models/property.rb')
# Property.delete_all()
property_1 = Property.new({
  'number_of_bedrooms' => 4,
  'value'=> 100000,
  'year_build'=> 2018,
  'build' => 'detached',
  'address'=> '123 Hope Street'
})
property_1.save()

property_2 = Property.new({
  'number_of_bedrooms' => 2,
  'value'=> 200000,
  'year_build'=> 2019,
  'build' => 'semi_detached',
  'address' => '234 Bath Street'
})
property_2.save()
property_3 = Property.new({
  'number_of_bedrooms' => 5,
  'value'=> 500000,
  'year_build'=> 2009,
  'build' => 'flat',
  'address' => '2 Renfrew Street'
})
# property_1.number_of_bedrooms=1
# property_1.update()
# property_2.delete()
property = Property.find(1)
# address = '123 Hope Street'
property_found_by_address = Property.find_by_address('123 Hope Street')
property_found_by_address_not_existed = Property.find_by_address('1 Hope Street')
binding.pry
nil
