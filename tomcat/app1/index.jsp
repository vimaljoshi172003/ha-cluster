<%@ page import="java.net.InetAddress" %>
<%@ page import="java.sql.*" %>
<html>
<head><title>HA Cluster Test App</title></head>
<body>
  <h1>Tomcat Instance Info</h1>
  <p><b>Hostname:</b> <%= InetAddress.getLocalHost().getHostName() %></p>
  <p><b>Session ID:</b> <%= session.getId() %></p>
  <p><b>Session Created At:</b> <%= new java.util.Date(session.getCreationTime()) %></p>

  <h2>Database Connection Test</h2>
  <%
    String dbUrl = "jdbc:postgresql://postgres_db:5432/appdb";
    String dbUser = "appuser";
    String dbPassword = "apppassword";
    try {
      Class.forName("org.postgresql.Driver");
      Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
      Statement stmt = conn.createStatement();
      ResultSet rs = stmt.executeQuery("SELECT version()");
      if (rs.next()) {
  %>
        <p style="color:green;"><b>DB Status:</b> Connected Successfully</p>
        <p><b>Postgres Version:</b> <%= rs.getString(1) %></p>
  <%
      }
      rs.close();
      stmt.close();
      conn.close();
    } catch (Exception e) {
  %>
        <p style="color:red;"><b>DB Status:</b> Connection Failed</p>
        <p><b>Error:</b> <%= e.getMessage() %></p>
  <%
    }
  %>
</body>
</html>
