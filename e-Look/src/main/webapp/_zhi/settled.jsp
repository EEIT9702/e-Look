<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="Short Icon" type="image/x-icon" href="${initParam.icon}" />
<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<title>${initParam.systemName}</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap.js"></script>
</head>
<body>
<jsp:include page="${contextPath}/login.jsp"/>


<div class="row shop-tracking-status">
    
    <div class="col-md-12">
        <div class="well">
    
            <div class="form-horizontal">
                <div class="form-group">
                    <label for="inputOrderTrackingID" class="col-sm-2 control-label">Order id</label>
                        <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputOrderTrackingID" value="" placeholder="# put your order id here">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="button" id="shopGetOrderStatusID" class="btn btn-success">Get status</button>
                    </div>
                </div>
            </div>
    
            <h4>Your order status:</h4>

            <ul class="list-group">
                <li class="list-group-item">
                    <span class="prefix">Date created:</span>
                    <span class="label label-success">12.12.2013</span>
                </li>
                <li class="list-group-item">
                    <span class="prefix">Last update:</span>
                    <span class="label label-success">12.15.2013</span>
                </li>
                <li class="list-group-item">
                    <span class="prefix">Comment:</span>
                    <span class="label label-success">customer's comment goes here</span>
                </li>
                <li class="list-group-item">You can find out latest status of your order with the following link:</li>
                <li class="list-group-item"><a href="//tracking/link/goes/here">//tracking/link/goes/here</a></li>
            </ul>

            <div class="order-status">

                <div class="order-status-timeline">
                    <!-- class names: c0 c1 c2 c3 and c4 -->
                    <div class="order-status-timeline-completion c4"></div>
                </div>

                <div class="image-order-status image-order-status-new active img-circle">
                    <span class="status">Accepted</span>
                    <div class="icon"></div>
                </div>
                <div class="image-order-status image-order-status-active active img-circle">
                    <span class="status">In progress</span>
                    <div class="icon"></div>
                </div>
                <div class="image-order-status image-order-status-intransit img-circle">
                    <span class="status">Shipped</span>
                    <div class="icon"></div>
                </div>
                <div class="image-order-status image-order-status-delivered img-circle">
                    <span class="status">Delivered</span>
                    <div class="icon"></div>
                </div>
                <div class="image-order-status image-order-status-completed img-circle">
                    <span class="status">Completed</span>
                    <div class="icon"></div>
                </div>

            </div>
        </div>
    </div>

</div>

















<jsp:include page="${contextPath}/footer.jsp"/>

</body>
</html>