<jsp:include page="header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<div class="container-fluid">
	<h5 class="p-2" style="border-bottom: 2px solid orange;">Help Desk
		Tickets</h5>
	<div class="row">
		<div class="col-sm-12">
			<h4 class="p-2 text-center" style="border-bottom: 2px solid blue">All
				Tickets</h4>
				<jsp:include page="msg.jsp"></jsp:include>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Query Date</th>
						<th>Customer</th>
						<th>Subject</th>
						<th style="width: 300px">Message</th>
						<th>Status</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${items }" var="m">
						<tr>
							<td><fmt:formatDate pattern="dd-MMM-yyyy" value="${m.date }" />
							</td>
							<td>${m.customer.fname }${m.customer.lname }</td>
							<td>${m.subject }</td>
							<td>${m.description }</td>
							<td>${m.status }</td>
							<td><c:choose>
									<c:when test="${m.status == 'Processed' }">
										<button type="button" class="btn btn-success"
											data-toggle="modal" data-target="#m${m.id }">View
											Reply</button>
									</c:when>
									<c:otherwise>
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#r${m.id }">Reply</button>
									</c:otherwise>
								</c:choose></td>
						</tr>
						<!-- Reply Send Modal -->
						<div class="modal fade" id="m${m.id }" tabindex="-1" role="dialog"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Modal
											title</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<h5>${m.reply }</h5>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Close</button>
										<button type="button" class="btn btn-primary">Save
											changes</button>
									</div>
								</div>
							</div>
						</div>
						<!-- Reply Dialog Modal -->
						<div class="modal fade" id="r${m.id }" tabindex="-1" role="dialog"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<form method="post">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">Modal
												title</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<div class="form-group">
												<input type="hidden" value="${m.id }" name="id"> <label
													class="p-2">Subject</label> <input type="text" readonly
													name="subject" value="${m.subject }" class="form-control">
											</div>
											<div class="form-group">
												<label class="p-2">Reply</label>
												<textarea required name="reply" class="form-control"
													rows="5"></textarea>
											</div>
										</div>
										<div class="modal-footer">
											<input type="submit" value="Save Reply" class="btn btn-primary">
										</div>
									</form>
								</div>
							</div>
						</div>
					</c:forEach>
				</tbody>
			</table>
		</div>		
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>