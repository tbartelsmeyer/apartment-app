Apartment.destroy_all
Tenant.destroy_all

10.times do
  Apartment.create(address: Faker::Address.full_address)
end

20.times do
  Tenant.create(name: Faker::Name.name, apartment_id: Apartment.all.sample.id)
end