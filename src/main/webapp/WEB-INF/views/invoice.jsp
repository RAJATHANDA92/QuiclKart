<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<!-- saved from url=(0051)http://demo.harnishdesign.net/html/koice/index.html -->
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="image/logo.png" rel="icon">
        <title>Invoice - Book Store</title>
        <link rel="stylesheet" type="text/css" href="/css/plugins.css">
        <link rel="stylesheet" type="text/css" href="/css/stylesheet.css">
    </head>
    <body>
        <!-- Container -->
        <div class="container-fluid invoice-container">
            <!-- Header -->
            <header>
                <div class="row align-items-center">
                    <div class="col-sm-7 text-center text-sm-left mb-3 mb-sm-0">
                        <img id="logo" src="/images/logo.png" style="width:120px;">
                    </div>
                    <div class="col-sm-5 text-center text-sm-right">
                        <h4 class="text-7 mb-0">Invoice</h4>
                    </div>
                </div>
                <hr>
            </header>

            <!-- Main Content -->
            <main>
                <div class="row">
                    <div class="col-sm-6"><strong>Date:</strong> <fmt:parseDate value="${o.orderdate}"
								pattern="yyyy-MM-dd" var="orderdate" type="date" /> <fmt:formatDate
								pattern="dd-MMM-yyyy" value="${orderdate}" /></div>
                    <div class="col-sm-6 text-sm-right"> <strong>Invoice No:</strong> ${o.id }</div>

                </div>
                <hr>
                <div class="row">
                    <div class="col-sm-6 text-sm-right order-sm-1"> <strong>Pay To:</strong>
                        <address>
                            Address Line 1<br>
                            Address Line 2<br>
                            New Delhi<br>
                            India
                        </address>
                    </div>
                    <div class="col-sm-6 order-sm-0"> <strong>Invoiced To:</strong>
                        <address>
                            ${uname }<br>
                            New Friends Club<br>
                            New Delhi<br>
                            India
                        </address>
                    </div>
                </div>

                <div class="card">
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table mb-0">
                                <thead class="card-header">
                                    <tr>
                                        <td class="border-0"><strong>Product #</strong></td>
                                        <td class="border-0"><strong>Product Name</strong></td>
                                        <td class="text-center border-0"><strong>Price</strong></td>
                                        <td class="text-center border-0"><strong>QTY</strong></td>
                                        <td class="text-right border-0"><strong>Amount</strong></td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${items }" var="item">
                                    <tr>
                                        <td class="border-0">${item.product.prodid }</td>
                                        <td class="border-0">${item.product.pname }</td>
                                        <td class="border-0">${item.price }</td>
                                        <td class="border-0">${item.qty }</td>
                                        <td class="border-0">${item.qty*item.price }</td>                                        
                                    </tr>
                                    </c:forEach>
                                </tbody>
                                <tfoot class="card-footer">
                                    <tr>
                                        <td colspan="4" class="text-right"><strong>Sub Total:</strong></td>
                                        <td class="text-right">${o.totalOrderPrice}</td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" class="text-right"><strong>Tax:</strong></td>
                                        <td class="text-right">${o.totalOrderPrice * 0.10}</td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" class="text-right"><strong>Total:</strong></td>
                                        <td class="text-right">${o.totalOrderPrice+o.totalOrderPrice * 0.10}</td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </main>
            <!-- Footer -->
            <footer class="text-center mt-4">
                <p class="text-1"><strong>NOTE :</strong> This is computer generated receipt and does not require physical signature.</p>
                <div class="btn-group btn-group-sm d-print-none"> <a href="javascript:window.print()" class="btn btn-light border text-black-50 shadow-none"><i class="fa fa-print"></i> Print</a> 
                    </div>
            </footer>
        </div>

    </body>
</html>