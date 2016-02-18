$( document ).ready(function() {

$("form").submit(function() { 
  var mol = sketcher.getMolecule();
  var molFile = ChemDoodle.writeMOL(mol);
  $('#compound_structure').val(molFile);
  });


/* validation */
            $(".new_compound").validate({
            	rules: {
                  "compound[name]": "required",
                  "compound[molecular_formula]": "required",
                  "compound[molar_mass]": "required",
                  "compound[shelf]": "required",
                  "compound[room_number]": "required"
              },
                messages: {
                	"compound[name]": "Please enter name",
                	"compound[molecular_formula]": "Please enter molecular formula",
                	"compound[molar_mass]": "Please enter molar mass",
                	"compound[shelf]": "Please enter shelf",
                	"compound[room_number]": "Please enter room number"
                }
            });
/* validation */
    
/* getinfo method */
$( "#getinfo" ).click(function() {

var mol = sketcher.getMolecule();
var molFile = ChemDoodle.writeMOL(mol);
var url = '/compounds/getinfo' ;

  $.ajax({
   	url: url,
   	type: 'GET',
   	data: {mol: molFile},
    success: function(data){ 
    			$("#compound_molecular_formula").val(data.formula);
    			$("#compound_molar_mass").val(data.mol_weight);
    		}
  });

});
/* getinfo method */


});