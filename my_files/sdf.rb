last = Compound.last.id
query = Compound.find(1)
chk_id = Array.new

for i in 1..last
chk = query.structure + "\n\\\$\\\$\\\$\\\$\n" + Compound.find(i).structure
chk = %x(echo "#{chk}"|matchmol -)

if chk[2] == "T"
	chk_id << Compound.find(i).id
end

end
puts chk_id