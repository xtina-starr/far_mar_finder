require 'csv'
require 'faker'
require 'date'
# [ID, Name, No of Employees, Date Opened, Market_id]
# CSV.open('vendors.csv', 'w') do |csv|
#   index = 0
#   CSV.read('markets.csv').length.times do |id|
#     (rand(10) + 1).times do |n|
#       index += 1
#       csv << [index, Faker::Company.name, rand(11) + 1, id+1]
#     end
#   end
# end
# 
# from = 808931628.0
# to   = Time.now
# # ID, Amount, Time, Vendor_id, Product_id
# CSV.open('sales.csv', 'w') do |csv|
#   index = 0
#   product_count = CSV.read('products.csv').length
#   CSV.read('vendors.csv').length.times do |id|
#     rand(10).times do |n|
#       index += 1
#       time = Time.at(from + rand * (to.to_f - from.to_f))
#       csv << [index, "$#{rand(99)}.#{rand(100)}", time, id+1, rand(product_count + 1)]
#     end
#   end
# end

# a = ["Great", "Stale", "Salty", "Moist", "Grand", "Fluffy", "Nom Nom", "Cheesy", "Incredible", "Edible", "Stupendous", "Scrumptious", "Savory", "Boom-Town", "Pickled", "Righteous", "Plain", "Fuzzy", "Floppy", "Kickin'", "Jumpin'", "Boring", "Bland", "Greasy", "Spicy"] + %w(afraid agreeable amused ancient angry annoyed anxious arrogant ashamed average awful bad beautiful better big bitter black blue boiling brave breezy brief bright broad broken bumpy calm charming cheerful chilly clumsy cold colossal combative comfortable confused cooing cool cooperative courageous crazy creepy cruel cuddly curly curved damp dangerous deafening deep defeated defiant delicious delightful depressed determined dirty disgusted disturbed dizzy dry dull dusty eager early elated embarrassed empty encouraging energetic enthusiastic envious evil excited exuberant faint fair faithful fantastic fast fat few fierce filthy fine flaky flat fluffy foolish frail frantic fresh friendly frightened funny fuzzy gentle giant gigantic good gorgeous greasy great green grieving grubby grumpy handsome happy hard harsh healthy heavy helpful helpless high hilarious hissing hollow homeless horrible hot huge hungry hurt hushed husky icy ill immense itchy jealous jittery jolly juicy kind large late lazy light little lively lonely long loose loud lovely low lucky magnificent mammoth many massive melodic melted mighty miniature moaning modern mute mysterious narrow nasty naughty nervous new nice nosy numerous nutty obedient obnoxious odd old orange ordinary outrageous panicky perfect petite plastic pleasant precious pretty prickly proud puny purple purring quaint quick quickest quiet rainy rapid rare raspy ratty red relieved M – R   R – S  repulsive resonant ripe roasted robust rotten rough round sad salty scary scattered scrawny screeching selfish shaggy shaky shallow sharp shivering short shrill silent silky silly skinny slimy slippery slow small smiling smooth soft solid sore sour spicy splendid spotty square squealing stale steady steep sticky stingy straight strange striped strong successful sweet swift tall tame tan tart tasteless tasty tender tender tense terrible testy thirsty thoughtful thoughtless thundering tight tiny tired tough tricky troubled ugliest ugly uneven upset uptight vast victorious vivacious voiceless wasteful watery weak weary wet whispering wicked wide wide-eyed witty wonderful wooden worried yellow young yummy zany)
# b = ["Bread", "Pretzel", "Honey", "Fish", "Beef", "Chicken", "Mushrooms", "Greens", "Apples", "Burrito", "Fruit", "Carrots", "Beets"]
# 
# CSV.open("products.csv", "w") do |csv|
#   index = 0
#   CSV.read('vendors.csv').length.times do |id|
#     (rand(5) + 1).times do
#       index += 1
#       csv << [index, "#{a.sample.capitalize} #{b.sample}", id + 1]
#     end
#   end
# end
from = 808931628.0
to   = Time.now
CSV.open('sales.csv', 'r+') do |csv|
  CSV.read('sales.csv').each do |row|
    row[2] = time = Time.at(from + rand * (to.to_f - from.to_f))
    csv << row
  end
end

