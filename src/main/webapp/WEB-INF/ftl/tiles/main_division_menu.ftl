[#ftl]
	      <div class="secmenu">
				[#if divisionList??]
					<ul id="prod_nav">
				      	<li class="first-of-type"><span>Divisions</span></li>
						[#list divisionList as division]
							<li class="top">
								<a href=" [@spring.url '/tenders/${division.id}'/] ">
									${division.title}
								</a>
							</li>
						[/#list]
					</ul>
				[/#if]      
	      </div>