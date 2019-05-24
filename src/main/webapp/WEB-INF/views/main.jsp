<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Time Record Starshot</title>
    <link rel='stylesheet' href='webjars/bootstrap/3.4.1/css/bootstrap.min.css'>
    <link rel='stylesheet' href='assets/css/bootstrap-datetimepicker.min.css'>
    <link rel='stylesheet' href='assets/css/main.css'>

    <script type='text/javascript' src='webjars/jquery/1.11.1/jquery.min.js'></script>
    <script type='text/javascript' src='assets/js/moment.min.js'></script>
    <script type='text/javascript' src='webjars/bootstrap/3.4.1/js/bootstrap.min.js'></script>

    <script type='text/javascript' src='assets/js/bootstrap-datetimepicker.min.js'></script>

</head>
<body>
<div class="container">

    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">Time Record</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="timeRecord">Home</a></li>
                    <li><a data-toggle="modal"
                                          data-target="#addTimeRecordModal">Add Time Record</a></li>

                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                            <span class="glyphicon glyphicon-user"></span>&nbsp;
                            <strong>${username}</strong>
                            <span class="glyphicon glyphicon-chevron-down"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="logout">Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
    </nav>

    <c:if test="${message != null}">
        <div class="alert alert-success" role="alert">
                ${message}
        </div>
    </c:if>

    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">Time Record Filtering</h3>
        </div>
        <div class="panel-body">
            <form action="filterTimeRecord" method="post">
                <div class="form-group">
                    <label>Employee Name:</label>
                    <input class="form-control" name="employeeName">
                </div>

                <div class="form-group">
                    <label>Is Active:</label>
                    <select name="active" class="form-control" id="sel1">
                        <option value=""></option>
                        <option value="true">yes</option>
                        <option value="false">no</option>
                    </select>
                </div>
                <input type="submit" class="btn btn-success" value="Filter">
            </form>
        </div>
    </div>



    <div class="panel panel-primary">
        <div class="panel-heading">
            <h2 class="panel-title">Time Record List</h2>
        </div>
        <div class="panel-body">
            <div class="table-wrapper">
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
                            <input name="timeIn" type="hidden"
                                   value="<fmt:formatDate pattern = "MM/dd/yyyy hh:mm a" value = "${timeRecord.timeIn}" />"/>
                            <input name="timeOut" type="hidden"
                                   value="<fmt:formatDate pattern = "MM/dd/yyyy hh:mm a" value = "${timeRecord.timeOut}" />"/>
                            <input name="active" type="hidden" value="${timeRecord.active}">
                            <td>${timeRecord.id}</td>
                            <td>${timeRecord.employeeName}</td>
                            <td><fmt:formatDate pattern="MM/dd/yyyy hh:mm a" value="${timeRecord.timeIn}"/></td>
                            <td><fmt:formatDate pattern="MM/dd/yyyy hh:mm a" value="${timeRecord.timeOut}"/></td>
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
        </div>

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
                            <div class='input-group date'>
                                <input name="timeIn" type='text' class="form-control"/>
                                <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                                 </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Time out</label>
                            <label>Time In</label>
                            <div class='input-group date'>
                                <input name="timeOut" type='text' class="form-control"/>
                                <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                                 </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>
                                <input name="active" type="checkbox">
                                Active Status
                            </label>
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
                            <div class='input-group date'>
                                <input name="timeIn" type='text' class="form-control"/>
                                <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                                 </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Time out</label>
                            <label>Time In</label>
                            <div class='input-group date'>
                                <input name="timeOut" type='text' class="form-control"/>
                                <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                                 </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>
                                <input name="active" type="checkbox">
                                Active Status
                            </label>
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
                        <h4 class="modal-title">Delete Time Record</h4>
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
    $("div .date").datetimepicker();

    $("#editTimeRecordModal").on('show.bs.modal', function (e) {
        var timeRecordId = $(e.relatedTarget).data('id');
        var t = $("tr[data-id='" + timeRecordId + "']").find('input').serializeArray();
        t.forEach(function (item) {
            var itemInput = $("form[action='updateTimeRecord']").find("input[name='" + item.name + "']");
            if (item.name == 'active') {
                if(item.value=="true") {
                    itemInput.prop('checked', item.value);
                } else {
                    itemInput.removeAttr('checked');
                }
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
