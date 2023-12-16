<%@page import="com.quegen.db.ConnectDB" %>
<%@page import="java.sql.*" %>
<%@page import="com.quegen.services.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Generate 30</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: NiceAdmin
  * Updated: Jul 27 2023 with Bootstrap v5.3.1
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  <style>
  .button-container {
    display: flex;
    justify-content: center; /* Center horizontally */
    align-items: center; /* Center vertically */
    margin-bottom: 10px; /* Add your desired margin value */
  }

  .btn.btn-primary {
    margin-right: 5px; /* Add your desired margin value */
  }
</style>


</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="index.html" class="logo d-flex align-items-center">
        <img src="assets/img/logo.png" alt="">
        <span class="d-none d-lg-block">R C P I T</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

    <div class="search-bar">
      <form class="search-form d-flex align-items-center" method="POST" action="#">
        <input type="text" name="query" placeholder="Search" title="Enter search keyword">
        <button type="submit" title="Search"><i class="bi bi-search"></i></button>
      </form>
    </div><!-- End Search Bar -->

    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">

        <li class="nav-item d-block d-lg-none">
          <a class="nav-link nav-icon search-bar-toggle " href="#">
            <i class="bi bi-search"></i>
          </a>
        </li><!-- End Search Icon-->

        

      </ul>
    </nav><!-- End Icons Navigation -->

  </header><!-- End Header -->

  <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link " href="teacherDashboard.html">
          <i class="bi bi-grid"></i>
          <span>Dashboard</span>
        </a>
      </li><!-- End Dashboard Nav -->


      

      <li class="nav-item">
        <a class="nav-link collapsed" href="addQuestion.html">
          <i class="bi bi-card-list"></i>
          <span>Add Questions</span>
        </a>
      </li><!-- End Register Page Nav -->
      
      <li class="nav-item">
        <a class="nav-link collapsed" href="viewQuestion.jsp">
          <i class="bi bi-file-earmark"></i>
          <span>View Questions</span>
        </a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link collapsed" href="deleteQuestion.jsp">
          <i class="bi bi-dash-circle"></i>
          <span>Delete Questions</span>
        </a>
      </li><!-- End Error 404 Page Nav -->
<li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-journal-text"></i><span>Generate Question Paper</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
         <li>
            <a href="Unit.jsp">
              <i class="bi bi-circle"></i><span>30 Marks</span>
            </a>
          </li>
          <li>
            <a href="Generate75.jsp">
              <i class="bi bi-circle"></i><span>75 Marks</span>
            </a>
          </li>
        </ul>
      </li><!-- End Forms Nav -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="teacherLogin.html">
          <i class="bi bi-box-arrow-in-right"></i>
          <span>Log Out</span>
        </a>
      </li><!-- End Login Page Nav -->

      

      

    </ul>

  </aside><!-- End Sidebar-->

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Dashboard</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item active">Dashboard</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
      <div class="row">

        <!-- Left side columns -->
        <div class="col-lg-12">
          <div class="row">

  
<!-- General Form Elements -->
              <table class="table">
                  <thead>
                    <tr>
                      <th class="question-number">Que. No.</th>
                  <th class="question-text">Question</th>
                  <th class="question-marks">Marks</th>
                    </tr>
                  </thead>
                  <%
                    try {
                      Connection con = ConnectDB.getConnect();
                      int tid = TeacherData.getTid();
                      String unit = TeacherData.getUnit();
                      PreparedStatement ps2 = con.prepareStatement("SELECT * FROM questions WHERE t_id=? AND unit=? ORDER BY RAND() LIMIT 5 ");
                      ps2.setInt(1, tid);
                      ps2.setString(2, unit);
                      ResultSet rs2 = ps2.executeQuery();

                      // Calculate total available weightage for 5 questions (assuming 30 total weightage)
                      int totalWeightage = 30;
                      int totalWeightageUsed = 0;
						int i = 1;
                      while (rs2.next()) {
                        int questionWeightage = rs2.getInt(5); // Get the weightage of the question
                        totalWeightageUsed += questionWeightage;

                        // Ensure the total weightage doesn't exceed 30
                        if (totalWeightageUsed > totalWeightage) {
                          break; // Stop adding questions once the total weightage exceeds 30
                        }
                  %>
                  <tbody>
                    <tr>
                      <th scope="row"><%= "Q. "+i %></th>
                      <td><%= rs2.getString(4) %></td>
                      <td><%= rs2.getInt(5) %></td>
                    </tr>
                  </tbody>
                  <%
                  i++;
                      }
                    } catch (SQLException e) {
                      e.printStackTrace();
                      // Handle the exception or log the error as needed
                    }
                  %>
                </table>
				<div class="button-container">
				  <button class="btn btn-primary" input type="button" value="Reload Page" onClick="window.location.reload(true)">Regenerate Paper</button>
				  <button class="btn btn-primary" onclick="printTable()">Print Paper</button>
				</div>


       
          


        </div><!-- End Right side columns -->

      </div>
      </div>
    </section>
  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="copyright">
      &copy; Copyright <strong><span>R C P I T</span></strong>. All Rights Reserved
    </div>
    <div class="credits">
      <!-- All the links in the footer should remain intact. -->
      <!-- You can delete the links only if you purchased the pro version. -->
      <!-- Licensing information: https://bootstrapmade.com/license/ -->
      <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
      Designed by <a href="www.linkedin.com/in/vishal-vanjari-bb64b8228">Vishal Vanjari</a>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/chart.js/chart.umd.js"></script>
  <script src="assets/vendor/echarts/echarts.min.js"></script>
  <script src="assets/vendor/quill/quill.min.js"></script>
  <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>
<script>
  function printTable() {
    // Get the table element
    var table = document.querySelector("table");

    // Create a new window for printing
    var printWindow = window.open('', '_blank');

    // Set the HTML content of the new window to include the CSS and table's content
    var htmlContent = `
      <html>
        <head>
          <title>Question Paper</title>
          <style>
            body {
              font-family: Arial, sans-serif;
              padding: 20px;
            }

            h1 {
              text-align: center;
              margin-bottom: 20px;
            }

            table {
              border-collapse: collapse;
              width: 100%;
            }

            th, td {
              border: 1px solid #000;
              padding: 8px;
            }

            th {
              background-color: #f2f2f2;
              text-align: center;
            }

            .question-number {
              text-align: center;
            }

            .question-text {
              font-weight: bold;
            }

            .question-marks {
              text-align: center;
            }
          </style>
        </head>
        <body>
          <h1>Question Paper</h1>
          ${table.outerHTML}
        </body>
      </html>
    `;

    // Write the formatted HTML content to the new window's document
    printWindow.document.write(htmlContent);

    // Close the document after printing is complete
    printWindow.document.close();

    // Call the print function to trigger the print dialog
    printWindow.print();
  }
</script>
</body>

</html>