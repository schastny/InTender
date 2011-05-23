[#ftl]
[#assign id = -1]
[#if tender??] 		[#assign id = tender.division.id] 	[/#if]
[#if division??] 	[#assign id = division.id] 			[/#if]
	      <div class="secmenu">
				[#if divisionList??]
					<ul id="prod_nav">
				      	<li class="first-of-type"><span>[@spring.message "menu.divisions"/]</span></li>
						[#list divisionList as division]
							<li class="top">
								<a [#if division.id == id]class="selected"[/#if] 
									href=" [@spring.url '/admin/${division.id}'/] ">
									${division.title}
								</a>
							</li>
						[/#list]
					</ul>
				[/#if]      
	      </div>