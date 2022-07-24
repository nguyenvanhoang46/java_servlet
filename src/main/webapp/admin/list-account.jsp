<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>List Account</title>
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
									<h4 class="card-title">Account list</h4>
									<form action="<%=request.getContextPath()%>/SearchAccountController">
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
													<th>Username</th>
													<th>Email</th>
													<th>IsSell</th>
													<th>IsAdmin</th>
													<th>Actions</th>
													<th>Actions</th>
												</tr>
											</thead>
											<tbody>

												<c:forEach var="account" items="${listAccount}">

													<tr>
														<td><c:out value="${account.id}" /></td>
														<td><c:out value="${account.user}" /></td>
														<td><c:out value="${account.email}" /></td>
														<td><c:out value="${account.isSell}" /></td>
														<td><c:out value="${account.isAdmin}" /></td>

														<td><a class="btn btn-primary"
															href="AccountCTL?action=editAccount&id=${account.id}">Edit</a>

														</td>
														<td><a class="btn btn-danger"
															href="AccountCTL?action=deleteAccount&id=${account.id}">Delete</a>
														</td>
													</tr>
												</c:forEach>
												<!-- } -->
											</tbody>

										</table>
										<button type="button" class="btn btn-primary"
											data-bs-toggle="modal" data-bs-target="#staticBackdrop">
											Add Account</button>

										<!-- Modal -->
										<div class="modal fade" id="staticBackdrop"
											data-bs-backdrop="static" data-bs-keyboard="false"
											tabindex="-1" aria-labelledby="staticBackdropLabel"
											aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="staticBackdropLabel">Add
															Account</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<form action="/AccountCTL?action=insertAccount"
														method="post">
														<div class="form-group">
															<c:if test="${account != null}">
																<input type="hidden" name="id"
																	value="<c:out value='${account.id}' />" />
															</c:if>

															<label for="exampleInputName1">Username</label> <input
																name="username" type="text" class="form-control"
																id="exampleInputName1"> <label
																for="exampleInputName1">Password</label> <input
																name="password" type="text" class="form-control"
																id="exampleInputName1"> <label
																for="exampleInputName1">Email</label> <input
																name="email" type="email" class="form-control"
																id="exampleInputName1"> <label
																for="exampleInputName1">Is Sell</label> <input
																name="isSell" type="number" class="form-control"
																id="exampleInputName1"> <label
																for="exampleInputName1">Is Admin</label> <input
																name="isAdmin" type="number" class="form-control"
																id="exampleInputName1">
														</div>

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
														href="AccountCTL?page=${currentPage - 1}" aria-label="Previous"> <span
															aria-hidden="true">&laquo;</span>
													</a></li>
													<c:forEach begin="1" end="${noOfPages}" var="item">
														<li class="page-item ms-4"><a
															class="page-link text-black"
															href="AccountCTL?page=${item}">${item}</a></li>
													</c:forEach>

													<li class="page-item ms-4"><a
														class="page-link text-danger" href="AccountCTL?page=${currentPage + 1}" aria-label="Next">
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

