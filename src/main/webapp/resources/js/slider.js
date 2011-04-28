$(document).ready(function(){
	
    $(".tender-new").toggle(function(){
    	$('.tender-new-form').show();
    	return false;
    }, function(){
    	$('.tender-new-form').hide();
    	return false;
    }); 

    $(".division-new").toggle(function(){
    	$('.division-new-form').show();
        return false;
    }, function(){
    	$('.division-new-form').hide();
        return false;
    });
    
    $(".tender-edit-1").click(function(){
    	$('.tender-edit-form').show();
    	$('.tender-edit-table').hide();
        return false;
    }); 
    
    $(".tender-edit-2").click(function(){
    	$('.tender-edit-form').hide();
    	$('.tender-edit-table').show();
        return false;
     }); 
    
});