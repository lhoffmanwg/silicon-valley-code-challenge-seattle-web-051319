require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

##VC objects
kev = VentureCapitalist.new("Kev", 5000000)
laura = VentureCapitalist.new("Laura", 1000000000)
tyler = VentureCapitalist.new("Tyler", 400000)
sarah = VentureCapitalist.new("Sarah", 300000)

##Startup objects
microsoft = Startup.new("Microsoft", "Bill", "software")
adobe = Startup.new("Adobe", "Chuck", "software")
ibm = Startup.new("IBM", "Joe", "hardware")
directv = Startup.new("DTV", "Scott", "entertainment")
koolaid = Startup.new("koolaid", "Scott", "drinks")

##funding objects
r1 = FundingRound.new(microsoft, kev, "Angel", 500000.0)
r2 = FundingRound.new(ibm, laura, "Pre-Seed", 100000.0)
r3 = FundingRound.new(adobe, sarah, "Seed", 10000.0)
r4 = FundingRound.new(microsoft, laura, "Series A", 400.0)
r5 = FundingRound.new(directv, tyler, "Angel", 10.0)
r6 = FundingRound.new(microsoft, kev, "Series A", 2000000.0)
r7 = FundingRound.new(adobe, laura, "Series A", 2000001.0)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
