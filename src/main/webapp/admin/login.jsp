<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
   
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Login</title>
   
  <link rel="stylesheet" href="<%=request.getContextPath()%>/Admin/vendors/typicons/typicons.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/Admin/vendors/css/vendor.bundle.base.css">
   
  <link rel="stylesheet" href="<%=request.getContextPath()%>/Admin/css/vertical-layout-light/style.css">
  
  <link rel="shortcut icon" href="<%=request.getContextPath()%>/Admin/images/favicon.png" />
</head>

<body>
  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
          <div class="col-lg-4 mx-auto">
            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
              <div class="brand-logo">
                <img src="<%=request.getContextPath()%>/Admin/images/logo-dark.svg" alt="logo">
              </div>
              <h4>Hello! let's get started</h4>
              <h6 class="font-weight-light">Sign in to continue.</h6>
              <form class="pt-3" action="LoginController" method="post">
                <div class="form-group">
                  <input type="name" class="form-control form-control-lg" id="exampleInputEmail1" name="txtname" placeholder="Username">
                </div>
                <div class="form-group">
                  <input type="password" class="form-control form-control-lg" id="exampleInputPassword1" name="txtpassword" placeholder="Password">
                  
                </div>
                <div class="mt-3">
                  <input type="submit" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" value="Login"> 
                </div>
                <div class="my-2 d-flex justify-content-between align-items-center">
                  <div class="form-check">
                    <label class="form-check-label text-muted">
                      <input type="checkbox" class="form-check-input">
                      Keep me signed in
                    </label>
                  </div>
                  <a href="#" class="auth-link text-black">Forgot password?</a>
                </div>
                <div class="mb-2">
                  <button type="button" class="btn btn-block btn-facebook auth-form-btn">
                    <i class="typcn typcn-social-facebook mr-2"></i>Connect using facebook
                  </button>
                </div>
                <div class="text-center mt-4 font-weight-light">
                  Don't have an account? <a href="register.html" class="text-primary">Create</a>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
   
  <script src="<%=request.getContextPath()%>/Admin/vendors/js/vendor.bundle.base.js"></script>
   
  <script src="<%=request.getContextPath()%>/Admin/../../js/off-canvas.js"></script>
  <script src="<%=request.getContextPath()%>/Admin/js/hoverable-collapse.js"></script>
  <script src="<%=request.getContextPath()%>/Admin/js/template.js"></script>
  <script src="<%=request.getContextPath()%>/Admin/js/settings.js"></script>
  <script src="<%=request.getContextPath()%>/Admin/s/todolist.js"></script>
  <!-- endinject -->
</body>

</html>
