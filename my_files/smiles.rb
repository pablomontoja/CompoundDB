last = Compound.last.id

for i in 1..last
smile = Compound.find(i).smiles
mol = %x( obabel -:"#{smile}" -o mol --gen2D )
molecule = Compound.find(i)
molecule.structure = mol
molecule.save
end