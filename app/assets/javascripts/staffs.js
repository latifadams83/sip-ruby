$("#staff_portal_access_true").change(function(){
    if($(this).is(':checked')){
      $('#accountDetails').show();
    }
});

$("#staff_portal_access_false").change(function(){
    if($(this).is(':checked')){
        $('#accountDetails').hide();
    }
});
