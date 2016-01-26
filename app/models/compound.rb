class Compound < ActiveRecord::Base

#if :molecular_formula.present?
#	debug
#	validates_format_of :molecular_formula, with: /\A((#{ChemistryRails::ELEMENTS.reject(&:nil?).map{|i| i[:short] }.join('|')})+[0-9]*)+\Z/
#end
	
end
