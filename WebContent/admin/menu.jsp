	<div class="leftside-navigation">
			<ul class="sidebar-menu" id="nav-accordion">
			<li><a class="active" href="index.html"> <i
						class="fa fa-dashboard"></i> <span>Dashboard</span>
				</a></li>
				
					<!-- Manage Country -->
					
						<li class="sub-menu"><a href="javascript:;"> <i
						class="fa fa-tasks"></i> <span>Manage Country</span>
				</a>
					<ul class="sub">
						<li><a href="addCountry.jsp">Add Country</a></li>
						<li><a href="<%=request.getContextPath()%>/CountryController?flag=search">Search Country</a></li>
						
					</ul></li>
					
					<!-- Manage State -->
					
						<li class="sub-menu"><a href="javascript:;"> <i
						class="fa fa-tasks"></i> <span>Manage State</sp7;an>
				</a>
					<ul class="sub">
						<li><a href="<%=request.getContextPath()%>/StateController?flag=LoadCountry">Add State</a></li>
						<li><a href="<%=request.getContextPath() %>/StateController?flag=search">Search State</a></li>
						
					</ul></li>
					
					<!-- Manage City -->
					
						
						<li class="sub-menu"><a href="javascript:;"> <i
						class="fa fa-tasks"></i> <span>Manage City</span>
				</a>
					<ul class="sub">
						<li><a href="<%=request.getContextPath()%>/CityController?flag=LoadCountry">Add City</a></li>
						<li><a href="<%=request.getContextPath()%>/CityController?flag=search">Search City</a></li>
						
					</ul></li>
					
					
					<!-- Manage Area -->
					
							
						<li class="sub-menu"><a href="javascript:;"> <i
						class="fa fa-tasks"></i> <span>Manage Area</span>
				</a>
					<ul class="sub">
						<li><a href="<%=request.getContextPath()%>/AreaController?flag=LoadCountry">Add Area</a></li>
						<li><a href="<%=request.getContextPath()%>/AreaController?flag=search">Search Area</a></li>
						
					</ul></li>
					
					<!--  -->
					<li class="sub-menu"><a href="javascript:;"> <i
						class="fa fa-tasks"></i> <span>Manage User</span>
				</a>
					<ul class="sub">
						<li><a href="addUser.jsp">Add User</a></li>
						<li><a href="searchUser.jsp">Search User</a></li>
					</ul></li>
				
				<li class="sub-menu"><a href="javascript:;">
				 <i class="fa fa-tasks"></i> <span>Manage Category</span>
				</a>
					<ul class="sub">
						<li><a href="addCategory.jsp">Add Category</a></li>
						<li><a href="searchCategory.jsp">Search Category</a></li>
						
					</ul></li>
					
					<!-- Manage Sub-category -->
					
					<li class="sub-menu"><a href="javascript:;"> <i
						class="fa fa-tasks"></i> <span>Manage Sub-Category</span>
				</a>
					<ul class="sub">
						<li><a href="addSubcategory.jsp">Add Sub-Category</a></li>
						<li><a href="searchSubcategory.jsp">Search Sub-Category</a></li>
						
					</ul></li>
				
				<!-- <li><a href="fontawesome.html"> <i class="fa fa-bullhorn"></i>
						<span>Manage Sub-Category</span>
				</a></li>
				<li class="sub-menu"><a href="javascript:;"> <i
						class="fa fa-th"></i> <span>Data Tables</span>
				</a>
					<ul class="sub">
						<li><a href="basic_table.html">Basic Table</a></li>
						<li><a href="responsive_table.html">Responsive Table</a></li>
						<li><a href="dynamic_table.html">Dynamic Table</a></li>
						<li><a href="editable_table.html">Editable Table</a></li>
					</ul></li>
				<li class="sub-menu"><a href="javascript:;"> <i
						class="fa fa-tasks"></i> <span>Form Components</span>
				</a>
					<ul class="sub">
						<li><a href="form_component.html">Form Elements</a></li>
						<li><a href="advanced_form.html">Advanced Components</a></li>
						<li><a href="form_wizard.html">Form Wizard</a></li>
						<li><a href="form_validation.html">Form Validation</a></li>
						<li><a href="file_upload.html">Muliple File Upload</a></li>

						<li><a href="dropzone.html">Dropzone</a></li>
						<li><a href="inline_editor.html">Inline Editor</a></li>

					</ul></li>
				<li class="sub-menu"><a href="javascript:;"> <i
						class="fa fa-envelope"></i> <span>Mail </span>
				</a>
					<ul class="sub">
						<li><a href="mail.html">Inbox</a></li>
						<li><a href="mail_compose.html">Compose Mail</a></li>
						<li><a href="mail_view.html">View Mail</a></li>
					</ul></li>
				<li class="sub-menu"><a href="javascript:;"> <i
						class=" fa fa-bar-chart-o"></i> <span>Charts</span>
				</a>
					<ul class="sub">
						<li><a href="morris.html">Morris</a></li>
						<li><a href="chartjs.html">Chartjs</a></li>
						<li><a href="flot_chart.html">Flot Charts</a></li>
						<li><a href="c3_chart.html">C3 Chart</a></li>
					</ul></li>
				<li class="sub-menu"><a href="javascript:;"> <i
						class=" fa fa-bar-chart-o"></i> <span>Maps</span>
				</a>
					<ul class="sub">
						<li><a href="google_map.html">Google Map</a></li>
						<li><a href="vector_map.html">Vector Map</a></li>
					</ul></li>
				<li class="sub-menu"><a href="javascript:;"> <i
						class="fa fa-glass"></i> <span>Extra</span>
				</a>
					<ul class="sub">
						<li><a href="500.html">500 Error</a></li>
						<li><a href="registration.html">Registration</a></li>
					</ul></li>
				 --><li><a href="<%=request.getContextPath()%>/CountryController?flag=logout"> <i class="fa fa-user"></i> <span>Logout</span>
				</a></li>
			</ul>
		</div>