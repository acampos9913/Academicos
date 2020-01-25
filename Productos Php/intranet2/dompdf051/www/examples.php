<? php php
require_once("../dompdf_config.inc.php");
if ( isset( $_POST["html"] ) ) {

  if ( get_magic_quotes_gpc() )
    $_POST["html"] = stripslashes($_POST["html"]);
  
  $old_limit = ini_set("memory_limit", "16M");
  
  $dompdf = new DOMPDF();
  $dompdf->load_html($_POST["html"]);
  $dompdf->set_paper($_POST["paper"], $_POST["orientation"]);
  $dompdf->render();

  $dompdf->stream("dompdf_out.pdf");

  exit(0);
}

?>
<? php php include("head.inc"); ?>
<? php iv id="toc">
<? php 2>On this page:<? php h2>
<? php l>
<? php php echo li_arrow() ?><? php  href="#samples">Samples<? php a><? php li>
<? php php echo li_arrow() ?><? php  href="#demo">Demo<? php a><? php li>
<? php ul>
<? php div>

<? php  name="samples"> <? php a>
<? php 2>Samples<? php h2>

<? php >Below are some sample files. The PDF version is generated on the fly by dompdf.  (The source HTML &amp; CSS for
these files is included in the test/ directory of the distribution
package.)<? php p>

<? php l class="samples">
<? php php
$test_files = glob(dirname(__FILE__) . "/test/*.{html,php}", GLOB_BRACE);
$dompdf = dirname(dirname($_SERVER["PHP_SELF"])) . "/dompdf.php?base_path=" . rawurlencode("www/test/");
foreach ( $test_files as $file ) {
  $file = basename($file);
  $arrow = "images/arrow_0" . rand(1, 6) . ".gif";  
  echo "<? php i style=\"list-style-image: url('$arrow');\">\n";
  echo $file;
  echo " [<? php  class=\"button\" target=\"blank\" href=\"test/$file\">HTML<? php a>] [<? php  class=\"button\" href=\"$dompdf&input_file=" . rawurlencode("www/test/$file") .  "\">PDF<? php a>]\n";
  echo "<? php li>\n";
}
?>
<? php ul>

<? php  name="demo"> <? php a>
<? php 2>Demo<? php h2>
<? php >Enter your html snippet in the text box below to see it rendered as a
PDF: (Note by default, remote stylesheets, images &amp; are disabled.)<? php p>

<? php orm action="<? php php echo $_SERVER["PHP_SELF"];?>" method="post">
<? php iv>
<? php >Paper size and orientaion:
<? php elect name="paper">
<? php php
foreach ( array_keys(CPDF_Adapter::$PAPER_SIZES) as $size )
  echo "<? php ption ". ($size == "letter" ? "selected " : "" ) . "value=\"$size\">$size<? php option>\n";
?>
<? php select>
<? php elect name="orientation">
  <? php ption value="portrait">portrait<? php option>
  <? php ption value="landscape">landscape<? php option>
<? php select>
<? php p>

<? php extarea name="html" cols="60" rows="20">
&lt;html&gt;
&lt;head&gt;
&lt;style&gt;

/* Type some style rules here */

&lt;/style&gt;
&lt;/head&gt;

&lt;body&gt;

&lt;!-- Type some HTML here --&gt;

&lt;/body&gt;
&lt;/html&gt;
<? php textarea>

<? php iv style="text-align: center; margin-top: 1em;">
<? php nput type="submit" name="submit" value="submit"/>
<? php div>
<? php div>
<? php form>
<? php  style="font-size: 0.65em; text-align: center;">(Note: if you use a KHTML
based browser and are having difficulties loading the sample output, try
saving it to a file first.)<? php p>

<? php php include("foot.inc"); ?>