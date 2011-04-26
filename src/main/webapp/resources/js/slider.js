$(document).ready(function(){

    $(".division-new").toggle(function(){
    	$('.division-new-form').show();
        return false;
    }, function(){
    	$('.division-new-form').hide();
        return false;
    });
    
    $(".item-new").toggle(function(){
    	$('.item-new-form').show();
    	return false;
    }, function(){
    	$('.item-new-form').hide();
    	return false;
    }); 
	
    $(".item-edit-1").click(function(){
    	$('.item-edit-form').show();
    	$('.item-edit-table').hide();
        return false;
    }); 
    
    $(".item-edit-2").click(function(){
    	$('.item-edit-form').hide();
    	$('.item-edit-table').show();
        return false;
     }); 
    
});