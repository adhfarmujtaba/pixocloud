<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page session="true"%>

<%
    session.removeAttribute("username");
    response.sendRedirect("index.jsp");
%>
