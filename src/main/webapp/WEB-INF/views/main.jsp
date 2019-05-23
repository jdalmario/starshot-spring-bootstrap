<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Time Record Starshot</title>
    <link rel='stylesheet' href='webjars/bootstrap/3.4.1/css/bootstrap.min.css'>
    <script type='text/javascript' src='webjars/jquery/1.11.1/jquery.min.js'></script>
    <script type='text/javascript' src='webjars/bootstrap/3.4.1/js/bootstrap.min.js'></script>
</head>
<body>
<div class="container">

    <c:if test="${message != null}">
        <div class="alert alert-success" role="alert">
                ${message}
        </div>
    </c:if>

    <a href="logout"><button class="btn btn-info">logout</button> </a>
    ${username}

    <div class="table-wrapper">
        <div class="table-title">
            <div class="row">
                <div class="col-sm-8"><h2>Time Record Details</h2></div>
                <div class="col-sm-4">
                    <button type="button" class="btn btn-info add-new" data-toggle="modal"
                            data-target="#addTimeRecordModal"><i class="fa fa-plus"></i> Add New
                    </button>
                </div>
            </div>
        </div>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>Id</th>
                <th>Employee Name</th>
                <th>Time in</th>
                <th>Time out</th>
                <th>Active</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach items="${timeRecords}" var="timeRecord">
                <tr data-id=${timeRecord.id}>
                    <input name="id" type="hidden" value="${timeRecord.id}">
                    <input name="employeeName" type="hidden" value="${timeRecord.employeeName}">
                    <input name="timeIn" type="hidden" value="${timeRecord.timeIn}">
                    <input name="timeOut" type="hidden" value="${timeRecord.timeOut}">
                    <input name="active" type="hidden" value="${timeRecord.active}">

                    <td>${timeRecord.id}</td>
                    <td>${timeRecord.employeeName}</td>
                    <td>${timeRecord.timeIn}</td>
                    <td>${timeRecord.timeOut}</td>
                    <td>${timeRecord.active ? 'yes': 'no'}</td>
                    <td>
                        <a class="edit" data-toggle="tooltip" data-original-title="Edit">
                            <i class="glyphicon glyphicon-edit"
                               data-id="${timeRecord.id}"
                               data-toggle="modal"
                               data-target="#editTimeRecordModal"></i></a>
                        <a class="delete" data-toggle="tooltip" data-original-title="Delete">
                            <i class="glyphicon glyphicon-remove-sign"
                               data-id="${timeRecord.id}"
                               data-toggle="modal"
                               data-target="#deleteTimeRecordModal">
                            </i></a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div id="addTimeRecordModal" class="modal fade in">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="addTimeRecord" method="post">
                    <div class="modal-header">
                        <h4 class="modal-title">Add Time Record</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Employee Name</label>
                            <input name="employeeName" type="text" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Time In</label>
                            <input name="timeIn" type="date" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Time out</label>
                            <input name="timeOut" type="date" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Active</label>
                            <input name="active" type="checkbox" class="form-control">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                        <input type="submit" class="btn btn-success" value="Add" id="addTimeRecord">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div id="editTimeRecordModal" class="modal fade in">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="updateTimeRecord" method="post">
                    <input type="hidden" name="id" value=""/>
                    <div class="modal-header">
                        <h4 class="modal-title">Update Time Record</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Name</label>
                            <input name="employeeName" type="text" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Time In</label>
                            <input name="timeIn" type="date" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Time out</label>
                            <input name="timeOut" type="date" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Active</label>
                            <input name="active" type="checkbox" class="form-control">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                        <input type="submit" class="btn btn-success" value="Update">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div id="deleteTimeRecordModal" class="modal fade in">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="deleteTimeRecord" method="post">
                    <input type="hidden" name="id" value="3">
                    <div class="modal-header">
                        <h4 class="modal-title">Update Time Record</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>Are you sure you want to delete?</p>
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                        <input type="submit" class="btn btn-success" value="Yes">
                    </div>
                </form>
            </div>
        </div>
    </div>

</div>
</body>
<script>
    console.log($);
    console.log(jQuery);

    $("#editTimeRecordModal").on('show.bs.modal', function (e) {
        var timeRecordId = $(e.relatedTarget).data('id');
        var t = $("tr[data-id='" + timeRecordId + "']").find('input').serializeArray();
        t.forEach(function (item) {
            var itemInput = $("form[action='updateTimeRecord']").find("input[name='" + item.name + "']");
            if (item.name == 'active') {
                itemInput.prop('checked', item.value);
            } else {
                itemInput.val(item.value);
            }
        });
    });

    $("#deleteTimeRecordModal").on('show.bs.modal', function (e) {
        var timeRecordId = $(e.relatedTarget).data('id');
        $("#deleteTimeRecordModal").find("input[name='id']").val(timeRecordId)
    })
</script>
</html>
