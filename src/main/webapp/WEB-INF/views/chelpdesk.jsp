<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<jsp:include page="cheader.jsp"></jsp:include>
<div class="container-fluid">

	<div class="card shadow my-2">
		<div class="card-body">
		<h4 class="p-2 font-weight-bold my-1" style="border-bottom: 2px solid orange;">Help Desk</h4>
		<button type="button" class="btn btn-primary btn-sm float-right"
data-toggle="modal" data-target="#exampleModal">
											New Ticket</button>
			<h4 class="p-2 text-center" style="border-bottom: 2px solid blue">All
				Tickets</h4>
			<table class="table table-bordered">
				<thead>
					<tr>
					<th>Ticket#</th>
						<th>Query Date</th>
						<th>Subject</th>
						<th>Message</th>
						<th>Status</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${items }" var="m">
						<tr>
						<td>${m.id }</td>
							<td><fmt:formatDate pattern="dd-MMM-yyyy" value="${m.date }" /></td>
							<td>${m.subject }</td>
							<td>${m.description }</td>
							<td>${m.status }</td>
							<td><c:choose>
									<c:when test="${m.status == 'Processed' }">
										<button data-target="#m${m.id }" data-toggle="modal"
											class="btn btn-primary btn-sm">View Reply</button>
										

									</c:when>
									<c:otherwise>
										<a href="/delticket/${m.id}" onclick="return confirm('Are you sure to delete this ticket ?')" class="btn btn-danger btn-sm">Delete</a>
									</c:otherwise>
								</c:choose></td>
						</tr>
<div class="modal fade" id="m${m.id }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Reply from Helpdesk</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       	<h5>${m.reply }</h5>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

					</c:forEach>
				</tbody>
			</table>
			<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<form method="post">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Create Ticket</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label class="p-2">Subject</label> <input type="text" required
							name="subject" class="form-control">
					</div>
					<div class="form-group">
						<label class="p-2">Message</label>
						<textarea required name="description" class="form-control"
							rows="5"></textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">Save changes</button>
				</div>
			</form>
		</div>
	</div>
</div>
		</div>
	</div>
</div>


<jsp:include page="cfooter.jsp"></jsp:include>