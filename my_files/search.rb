last = Compound.last.id
chk_id = Array.new

for i in 1..last
chk = %x( matchmol -x tmp/structures/chk.mol tmp/structures/#{i}.mol )

if chk[2] == "T"
	chk_id << Compound.find(i).id
end

end

puts chk_id