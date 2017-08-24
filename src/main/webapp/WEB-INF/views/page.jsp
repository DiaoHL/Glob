<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dllo
  Date: 17/8/23
  Time: 下午5:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<div class="row">
    <div class="col-md-4"></div>
    <div class="col-md-4">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <c:if test="${page.hasPreviousPage} == false">
                    <li class="disabled">
                                <span>
                                    <span aria-hidden="true">&laquo;</span>
                                </span>
                    </li>
                </c:if>
                <c:if test="${page.hasPreviousPage} == false">
                    <li>
                        <a href=""><span aria-hidden="true">&laquo;</span></a>
                    </li>
                </c:if>
                <c:forEach begin="0" end="${page.pages}" var="i">
                    <c:if test="${pageNum} == i">
                        <li class="active">
                            <span>${i} <span class="sr-only">(current)</span></span>
                        </li>
                    </c:if>
                    <c:if test="${pageNum} != i">
                        <li><a href="#">${i} </a></li>
                    </c:if>
                </c:forEach>
                <li class="active">
                    <span>1 <span class="sr-only">(current)</span></span>
                </li>
                <li><a href="#">2 </a></li>
                <li><a href="#">3 </a></li>
                <li><a href="#">4 </a></li>
                <li><a href="#">5 </a></li>

                <c:if test="${page.hasNextPage} == false">
                    <li class="disabled">
                                <span>
                                    <span aria-hidden="true">&raquo;</span>
                                </span>
                    </li>
                </c:if>
                <c:if test="${page.hasNextPage == true}">
                    <li>
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
            </ul>
        </nav>
    </div>
    <div class="col-md-4"></div>
</div>
</html>
