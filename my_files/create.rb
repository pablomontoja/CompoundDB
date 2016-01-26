last = Compound.last.id

for i in 1..last
molecule = Compound.find(i).structure
File.write("tmp/structures/#{i}.mol", molecule )
end