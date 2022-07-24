<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link" href="<%=request.getContextPath()%>/Admin/HomePage.jsp">
              <img alt="" src="<%=request.getContextPath()%>/Admin/images/home26.png" style=' margin-right: 10px;'> 
              <span class="menu-title">Home</span>
              <div class="badge badge-danger">new</div>
            </a>
          </li> 
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#form-elements" aria-expanded="false" aria-controls="form-elements">
               <img alt="" src="<%=request.getContextPath()%>/Admin/images/user26.png" style='    margin-right: 10px;'> 
              <span class="menu-title">Account</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="form-elements"> 
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/AccountCTL">List Account</a></li>
              </ul>
            </div> 
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#charts" aria-expanded="false" aria-controls="charts">
              <img alt="" src="<%=request.getContextPath()%>/Admin/images/product26.png" style='margin-right: 10px;'> 
              <span class="menu-title">Product</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="charts">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="<%=request.getContextPath()%>/ProductCTL">List Product</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#tables" aria-expanded="false" aria-controls="tables">
             <img alt="" src="<%=request.getContextPath()%>/Admin/images/category26.png" style='margin-right: 10px;'> 
              <span class="menu-title">Category</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="tables">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="<%=request.getContextPath()%>/CategoryCTL">List Category</a></li>
              </ul>
            </div>
          </li>
          
           
           
           
        </ul>
      </nav>