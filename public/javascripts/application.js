function hoverDetailReports() {
  $("#reports table tbody tr").click(function(){
      $.getScript('/reports/'+$(this).attr('rel')+'.js');
      $("#reports table tbody tr").removeClass('highlight');
      $(this).addClass("highlight");
  });
}
function updateColumnsEditor () {
  $('#columns ul').empty();
 $('#columns_editor input:checked').each(function(index) {
   $('#columns ul').append("<li>"+ $(this).val()+"</li>");
 });
}
function updateOptions (dialogType) {
  switch(dialogType) {
    case '#columns_editor' :
      updateColumnsEditor();
      break;
    //case '#sorts_editor':
    //  // code
    //case '#filters_editor':
    //  // code
    //case '#schedule_editor':
      // code
  }
}
function toggleWithin (parentSelector, child) {
 $(parentSelector + ' > * ').not(':last').hide();
 $(child).slideDown();
}
function reporterEditor () {
  $("[rel^='toggle_within']").click( function () {
    within = $(this).attr('rel').split('/')[1];
    toggleWithin(within, $(this).attr('href'));
  });
  $("#editors > div > button").click(function () {
      editor = $(this).closest("[id$='_editor']").attr('id');
      $('#'+editor).slideUp();
      if ($(this).text() == 'Ok') { updateOptions('#'+editor); };
      return false;
      });
}

function dialogs() {
  $('a.local_dialog').live('click', function () {
    var dialogId = $(this).attr('href');
    $(dialogId).dialog({
      buttons : {
				Ok : function() {
          updateOptions(dialogId)
					$( this ).dialog( "close" );
				},
				Cancel: function() {
					$( this ).dialog( "close" );
				} 
      }});
  })
}
$(document).ready( function() {
  $('body').append("<div id='new_id'><span>hello</span></div>");
   hoverDetailReports();
   dialogs();
   reporterEditor();
})
