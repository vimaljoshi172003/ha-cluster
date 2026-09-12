<%@ page import="java.net.InetAddress" %>
<html>
<head><title>HA Cluster Test App</title></head>
<body>
  <h1>Tomcat Instance Info</h1>
  <p><b>Hostname:</b> <%= InetAddress.getLocalHost().getHostName() %></p>
  <p><b>Session ID:</b> <%= session.getId() %></p>
  <p><b>Session Created At:</b> <%= new java.util.Date(session.getCreationTime()) %></p>
</body>
</html>
