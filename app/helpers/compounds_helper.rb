module CompoundsHelper

def get_formula(string="")
	ChemistryRails::Formula.new(string)
end

def get_user_name(user_id="")
	name = User.find(user_id).username if user_id.present?
	return name
end	

end
