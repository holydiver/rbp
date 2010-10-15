require 'faker'

puts "Generating random dataset..."

data = 5000.times.map do
  { name: Faker::Name.name, phone_number: Faker::PhoneNumber.phone_number,
    payment: rand(10000).to_s }
end

puts data.length

# Append ".25" to 5 random elements in the dataset
5.times { data[rand(data.length)][:payment] << ".25" }

puts "The following entries have invalid payment amounts: "
# Print all entries that contain a non-integer payment
data.select.with_index do |e,i|
  begin
    Integer(e[:payment]) > 1000
  rescue ArgumentError
    p [e,i]
  end
end

