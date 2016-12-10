$(function()
{
	$('body').on("mouseover",".contactItem",function()
	{
		$(this).find("span").show();
	});
	
	$('body').on("mouseleave",".contactItem",function()
	{
		$(this).find("span").hide();
	});
	
	$("#searchContact").keyup(function()
	{
		var value = $("#searchContact").val().toLowerCase();
//		alert("search :"+value);
		
		if(value!="")
		{
			$(".contactItem").hide().each(function()
			{
				var self = $(this);
				
				var s = self.text().toLowerCase();
				console.log("recherche "+value+" dans :"+ s);
				var matches = s.indexOf(value) != -1;
				
				if(matches)
				{
//					console.log("trouve : "+$(this).parent().html());
					$(this).closest(".contactItem").addClass("found");
//					alert("trouve "+value+" dans :"+ s);
					self.closest(".panel-collapse").addClass("in");
				}
				else
					$(this).closest(".contactItem").removeClass("found");
			});
			
			$(".found").show();
			
			var elements = $(".contactItem:visible").length;
			
			elements == 0 ? $(".groupPanel").hide() : $(".groupPanel").show();
		}
		else
		{
			$(".panel-collapse").removeClass("in");
			$(".groupPanel").show();
		}
		
	});
	
	$("body").on("click",".panel",function()
	{
		$(this).find(".contactItem").show();
	});
	
	$("body").on("click",".displayContact",function()
	{
		var group = $(this).parent().parent().parent().parent().prev().attr("data-group");
		$("#indexFormContainer").hide();
//		$("#cardContainer").show();
//		$("#cardContactName").text($(this).parent().parent().text());
//		$("#groupeLabel").text(group);
	});
	
});
