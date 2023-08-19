people = %w[A B C D E F]
r = rand(2..3)
people1 = people.sample(r).sort
people2 = people - people1
p people1
p people2
