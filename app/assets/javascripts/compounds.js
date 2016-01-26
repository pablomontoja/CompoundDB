$( document ).ready(function() {
$("form").submit(function() { 
  var mol = sketcher.getMolecule();
  var molFile = ChemDoodle.writeMOL(mol);
  $('#compound_structure').val(molFile);
  });
});