<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>List Product</title>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/Admin/vendors/typicons/typicons.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/Admin/vendors/css/vendor.bundle.base.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/Admin/css/style.css">
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/Admin/images/favicon.png" />
</head>
<body>
	<div class="container-scroller">
		<jsp:include page="partials/navbar.jsp" />

		<div class="container-fluid page-body-wrapper">

			<jsp:include page="partials/slidebar.jsp" />
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">


					<div class="row">
						<div class="col-lg-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Product list</h4>
									<form action="<%=request.getContextPath()%>/SearchProductController">
										<div class="input-group">
											<input type="text" name="keyword" value="${keyword1 }"
												class="form-control" placeholder="Search..."
												aria-label="search" aria-describedby="search">
											<div class="input-group-prepend">
												<button type="submit">Search</button>
											</div>
										</div>
									</form>
									<div class="table-responsive">
										<table class="table table-striped table-bordered ">
											<thead>
												<tr>
													<th>ID</th>
													<th>Name</th>
													<th>Price</th>
													<th>Image</th>
													<th>Category</th>
													<th>Actions</th>
													<th>Actions</th>
												</tr>
											</thead>
											<tbody>

												<c:forEach var="product" items="${listProduct}">

													<tr>
														<td><c:out value="${product.id}" /></td>
														<td><c:out value="${product.name}" /></td>
														<td><c:out value="${product.price}" /></td>
														<td><c:out value="${product.image}" /></td>

														<td><c:forEach var="category" items="${listCategory}">
																<c:if test="${product.category_id == category.getId()}">
																	<c:out value="${category.getName()}"></c:out>
																</c:if>
															</c:forEach></td>
														<td><a class="btn btn-primary"
															href="ProductCTL?action=editProduct&id=${product.id}">Edit</a>

														</td>
														<td><a class="btn btn-danger"
															href="ProductCTL?action=deleteProduct&id=${product.id}">Delete</a>
														</td>
													</tr>
												</c:forEach>
												<!-- } -->
											</tbody>
										</table>

										<button type="button" class="btn btn-primary"
											data-bs-toggle="modal" data-bs-target="#staticBackdrop">
											Add Product</button>
										

										<!-- Modal -->
										<div class="modal fade" id="staticBackdrop"
											data-bs-backdrop="static" data-bs-keyboard="false"
											tabindex="-1" aria-labelledby="staticBackdropLabel"
											aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="staticBackdropLabel">Add
															Product</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<form action="/ProductCTL?action=insertProduct"
														method="post" enctype="multipart/form-data">
														<c:if test="${prd != null}">
															<input type="hidden" name="id"
																value="<c:out value='${prd.id}' />" />
														</c:if>

														<fieldset class="form-group">
															<label>Product Name</label> <input type="text"
																class="form-control" name="name" required="required">
														</fieldset>

														<fieldset class="form-group">
															<label>Product price </label> <input type="number"
																class="form-control" name="price" value="123"required="required">
														</fieldset>
														<fieldset class="form-group">
															<label>Image</label> <input type="file"
																class="form-control" name="image"required="required">
														</fieldset>

														<fieldset class="form-group">
															<label>Category</label> <input type="text"
																class="form-control" name="category_id" required="required">

															<%-- <select name="category_id">
                    	<c:forEach var="category" items="${listCategory}"> 
                			<option value="${category.id}">value="${category.id}"</option>
                		 
                	</c:forEach>
                    	 
                    </select>--%>

														</fieldset>



														<div class="modal-footer">
															<button type="button" class="btn btn-secondary"
																data-bs-dismiss="modal">Close</button>
															<button type="submit" class="btn btn-success">Save</button>
														</div>
													</form>
												</div>
											</div>
										</div>
									 	<div class="container mt-4 d-flex justify-content-center">
											<nav class="text-center" aria-label="Page navigation example">
												<ul class="pagination">
													<li class="page-item"><a class="page-link text-danger"
														href="ProductCTL?page=${currentPage - 1}" aria-label="Previous"> <span
															aria-hidden="true">&laquo;</span>
													</a></li>
													<c:forEach begin="1" end="${noOfPages}" var="item">
														<li class="page-item ms-4"><a
															class="page-link text-black"
															href="ProductCTL?page=${item}">${item}</a></li>
													</c:forEach>

													<li class="page-item ms-4"><a
														class="page-link text-danger" href="ProductCTL?page=${currentPage + 1}" aria-label="Next">
															<span aria-hidden="true">&raquo;</span>
													</a></li>
												</ul>
											</nav>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>

		</div>

	</div>

	<script
		src="<%=request.getContextPath()%>/Admin/vendors/js/vendor.bundle.base.js"></script>

	<script
		src="<%=request.getContextPath()%>/Admin/vendors/chart.js/Chart.min.js"></script>

	<script src="<%=request.getContextPath()%>/Admin/js/off-canvas.js"></script>
	<script
		src="<%=request.getContextPath()%>/Admin/js/hoverable-collapse.js"></script>
	<script src="<%=request.getContextPath()%>/Admin/js/template.js"></script>
	<script src="<%=request.getContextPath()%>/Admin/js/settings.js"></script>
	<script src="<%=request.getContextPath()%>/Admin/js/todolist.js"></script>

	<script src="<%=request.getContextPath()%>/Admin/js/dashboard.js"></script>
</body>

</html>

