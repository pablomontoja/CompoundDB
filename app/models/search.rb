class Search < ActiveRecord::Base

def search_compounds

	compounds = Compound.all
	
	compounds = compounds.where(["name LIKE ?", "%#{keywords}%"]) if keywords.present?
	compounds = compounds.where(["molecular_formula LIKE ?", "%#{formula}%"]) if formula.present?
	compounds = compounds.where(["molar_mass >= ?", min_mass]) if min_mass.present?
	compounds = compounds.where(["molar_mass <= ?", max_mass]) if max_mass.present?
	compounds = compounds.where(["cas LIKE ?", "%#{cas_number}%"]) if cas_number.present?

	if molecule == "Molecule from ChemDoodle Web Components\r\n\r\nhttp://www.ichemlabs.com\r\n  1  0  0  0  0  0            999 V2000\r\n    0.0000    0.0000    0.0000 C   0  0  0  0  0  0\r\nM  END"
		return compounds
	end

	if molecule.present?
		last = Compound.last.id
		chk_id = Array.new

		for i in 1..last
			chk = %x( matchmol -x tmp/structures/chk.mol tmp/structures/#{i}.mol )

				if chk[2] == "T"
					chk_id << Compound.find(i).id
				end

		end

		compounds = compounds.where(id: chk_id) 
	end



	return compounds
end

end
