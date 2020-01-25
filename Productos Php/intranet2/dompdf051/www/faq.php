<? php php include("head.inc"); ?>
<? php  name="FAQ"> <? php a>
<? php 2>Frequently Asked Questions<? php h2>

<? php l>
<? php i><? php  href="#hello_world">Is there a 'hello world' script for dompdf?<? php a><? php li>

<? php i><? php  href="#save">How do I save a PDF to disk?<? php a><? php li>

<? php i><? php  href="#dom">I'm getting the following error: <? php r/>
 Fatal error: DOMPDF_autoload() [function.require]: Failed opening required
 '/var/www/dompdf/include/domdocument.cls.php'
 (include_path='.:') in
 /var/www/dompdf/dompdf_config.inc.php
 on line 146<? php a><? php li>

<? php i><? php  href="#exec_time">I'm getting the following error: <? php r/> Fatal error:
  Maximum execution time of 30 seconds exceeded in /var/www/dompdf/dompdf.php
  on line XXX<? php a><? php li>

<? php i><? php  href="#no_block_parent">I'm getting the following error:<? php r/>
Fatal error: Uncaught exception 'DOMPDF_Exception' with message 'No
block-level parent found. Not good.' in
C:\Program Files\Apache\htdocs\dompdf\include\inline_positioner.cls.php:68
...
<? php a><? php li>

<? php i><? php  href="#tables">I have a big table and it's broken!<? php a><? php li>

<? php i><? php  href="#footers">Is there a way to add headers and footers?<? php a><? php li>

<? php i><? php  href="#page_break">How do I insert page breaks?<? php a><? php li>

<? php i><? php  href="#zend_optimizer">I'm getting the following error:<? php r/>
Cannot access undefined property for object with
overloaded property access in
/var/www/dompdf/include/frame_tree.cls.php on line 160
<? php a><? php li>

<? php i><? php  href="#new_window">How can I make PDFs open in the browser window instead of
opening the download dialog?<? php a><? php li>

<? php i><? php  href="#centre">How do I centre a table, paragraph or div?<? php li>
<? php ol>

<? php iv class="divider1">&nbsp;<? php div>
<? php iv class="answers">
<? php  name="hello_world"> <? php a>
<? php 3>Is there a 'hello world' script for dompdf?<? php h3>

<? php >Here's a hello world script:
<? php re>
&lt;?php
require_once("dompdf_config.inc.php");
$html =
    '&lt;html&gt;&lt;body&gt;'.
    '&lt;p&gt;Hello World!&lt;/p&gt;'.
    '&lt;/body&gt;&lt;/html&gt;';

$dompdf = new DOMPDF();
$dompdf-&gt;load_html($html);

$dompdf-&gt;render();
$dompdf-&gt;stream("hello_world.pdf");

?&gt;
<? php pre>

<? php >Put this script in the same directory as
dompdf_config.inc.php.  You'll have to change the paths in
dompdf_config.inc.php to match your installation.<? php p>

<? php  href="#FAQ">[back to top]<? php a>
<? php iv class="divider2" style="background-position: 25% 0%">&nbsp;<? php div>

<? php  name="save"> <? php a>
<? php 3>How do I save a PDF to disk?<? php h3>

<? php >If you are using the included <? php  href="usage.php#web">dompdf.php<? php a> script you
can pass it the "save_file" option in conjunction with the "output_file" option.<? php p>

<? php >If you are using the DOMPDF class, you can save the generated PDF
by calling <? php ode>$dompdf-&gt;output()<? php code>:<? php p>

<? php re>
require_once("dompdf_config.inc.php");
$html = 
    '&lt;html&gt;&lt;body&gt;'.
    '&lt;p&gt;Foo&lt;/p&gt;'.
    '&lt;/body&gt;&lt;/html&gt;';

$dompdf = new DOMPDF();
$dompdf-&gt;load_html($html);

$dompdf-&gt;render();

// The next call will store the entire PDF as a string in $pdf

$pdf = $dompdf-&gt;output();  

// You can now write $pdf to disk, store it in a database or stream it
// to the client.

file_put_contents("saved_pdf.pdf", $pdf);
<? php pre>

<? php >Note that typically <? php ode>dompdf-&gt;stream()<? php code> and
<? php ode>dompdf-&gt;output()<? php code> are mutually exclusive.<? php p>

<? php  href="#FAQ">[back to top]<? php a>
<? php iv class="divider1" style="background-position: 721px 0%">&nbsp;<? php div>


<? php  name="dom"> <? php a>
<? php 3>I'm getting the following error: <? php r/>
 Fatal error: DOMPDF_autoload() [function.require]: Failed opening required
 '/var/www/dompdf/include/domdocument.cls.php'
 (include_path='.:') in
 /var/www/dompdf/dompdf_config.inc.php
 on line 146<? php h3>

<? php >This error occurs when the version of PHP that you are using does not have
the DOM extension enabled.  You can check which extensions are enabled by
examning the output of <? php ode>phpinfo()<? php code>.<? php p>

<? php >There are a couple of ways that the DOM extension could have been
disabled.  DOM uses libxml, so if libxml is not present on your server
then the DOM extension will not work.  Alternatively, if PHP was compiled
with the '--disable-dom' switch or the '--disable-xml' switch, DOM support
will also be removed.  You can check which switches were used to compile
PHP with <? php ode>phpinfo()<? php code>.<? php p>

<? php  href="#FAQ">[back to top]<? php a>
<? php iv class="divider1" style="background-position: 239px 0%">&nbsp;<? php div>

<? php  name="exec_time"> <? php a>
<? php 3>I'm getting the following error: <? php r/> Fatal error:
  Maximum execution time of 30 seconds exceeded in /var/www/dompdf/dompdf.php
  on line XXX<? php h3>

<? php >Nested tables are not supported yet (v0.4.3) and can cause dompdf to enter an
endless loop, thus giving rise to this error.<? php p>

<? php  href="#FAQ">[back to top]<? php a>
<? php iv class="divider1" style="background-position: 300px 0%">&nbsp;<? php div>

<? php  name="no_block_parent"> <? php a>
<? php 3>I'm getting the following error:<? php r/>
Fatal error: Uncaught exception 'DOMPDF_Exception' with message 'No
block-level parent found. Not good.' in
C:\Program Files\Apache\htdocs\dompdf\include\inline_positioner.cls.php:68
...<? php h3>

<? php >This should be fixed in versions 0.4.1 and up.  The error was
caused by <? php ode>parse_url()<? php code> thinking that the 'c' in 'c:\' was
a protocol.  Version 0.4.1 works around this issue.<? php p>

<? php  href="#FAQ">[back to top]<? php a>
<? php iv class="divider2" style="background-position: 130px 0%">&nbsp;<? php div>

<? php  name="tables"> <? php a>
<? php 3>I have a big table and it's broken!<? php h3>

<? php >This is fixed in versions 0.4 and higher.  Previous versions did not support tables that spanned pages.<? php p>

<? php  href="#FAQ">[back to top]<? php a>
<? php iv class="divider1" style="background-position: 812px 0%">&nbsp;<? php div>

<? php  name="footers"> <? php a>
<? php 3>Is there a way to add headers and footers?<? php h3>

<? php >Yes, you can add headers and footers using inline PHP.  Headers and
footers are added by accessing the PDF renderer directly using inline
PHP embedded in your HTML file.  This is similar to creating PDFs with
FPDF or ezPDF from R&amp;OS, in that you can draw lines, boxes and text
directly on the PDF.  Here are step by step instructions:<? php p>

<? php l>
<? php i> Somewhere in your html file, near the top, open a script tag with a "text/php" type:
<? php re>
  &lt;script type="text/php"&gt;
<? php pre>
<? php li>

<? php i> Check if the $pdf variable is set.  dompdf sets this variable when evaluating embedded PHP.
<? php re>
  &lt;script type="text/php"&gt;
 
  if ( isset($pdf) ) {
<? php pre>
<? php li>

<? php i> Pick a font:
<? php re>
  &lt;script type="text/php"&gt;
 
  if ( isset($pdf) ) {
  
    $font = Font_Metrics::get_font("verdana", "bold");
<? php pre>
<? php li>

<? php i> Use the CPDF_Adapter::page_text() method to set text that will be
displayed on every page:

<? php re>
  &lt;script type="text/php"&gt;
 
  if ( isset($pdf) ) {
  
    $font = Font_Metrics::get_font("verdana", "bold");
    $pdf-&gt;page_text(72, 18, "Fancy Header", $font, 6, array(0,0,0));

  }
  &lt;/script&gt;
<? php pre>

In this example, the text will be displayed 72pt (1 in) from the left
edge of the page and 18pt (1/4 in) from the top of the page, in 6pt
font.  The last argument to page_text() is the colour which takes an
array of the form array(r,g,b) where each of r, g, and b are between
0.0 and 1.0.  <? php li>

<? php i> There are several other methods available.  See the API
documentation for the CPDF_Adapter class (<? php 
href="doc/">http://www.digitaljunkies.ca/dompdf/doc<? php a>) for more
details.  Also have a look at the demo_01.html file in the www/test/
directory.  It adds a header and footer using
PDF_Adapter->page_text().  It also adds text superimposed over the
rendered text using a PDF 'object'.  This object is added using
CPDF_Adapter->add_object().  See <? php 
href="usage.php#inline">usage.php<? php a> for more info on inline PHP.<? php li>
<? php ol>

<? php  href="#FAQ">[back to top]<? php a>
<? php iv class="divider2" style="background-position: 12px 0%">&nbsp;<? php div>

<? php  name="page_break"> <? php a>
<? php 3>How do I insert page breaks?<? php h3>

<? php >Page breaks can be inserted by applying the CSS properties 
<? php  href="http://www.w3.org/TR/CSS21/page.html#propdef-page-break-before">page-break-before<? php a>
and 
<? php  href="http://www.w3.org/TR/CSS21/page.html#propdef-page-break-after">page-break-after<? php a> to
any block level element.<? php p>

<? php  href="#FAQ">[back to top]<? php a>
<? php iv class="divider1" style="background-position: 44px 0%">&nbsp;<? php div>

<? php  name="zend_optimizer"> <? php a>
<? php 3>I'm getting the following error:<? php r/>
Cannot access undefined property for object with
overloaded property access in
/var/www/dompdf/include/frame_tree.cls.php on line 160<? php h3>

<? php >This error is caused by an incompatibility with the Zend Optimizer.
Disable the optimizer when using dompdf.<? php p>

<? php  href="#FAQ">[back to top]<? php a>
<? php iv class="divider1" style="background-position: 991px 0%">&nbsp;<? php div>

<? php  name="new_window"> <? php a>
<? php 3>How can I make PDFs open in the browser window instead of
opening the download dialog?<? php h3>

<? php >This is controlled by the "Attachment" header sent by dompdf when
it streams the PDF to the client.  You can modify the headers sent by
dompdf by passing additional options to the
<? php ode>$dompdf->stream()<? php code> function:<? php p>

<? php re>
require_once("dompdf_config.inc.php");
$html = 
    '&lt;html&gt;&lt;body&gt;'.
    '&lt;p&gt;Some text&lt;/p&gt;'.
    '&lt;/body&gt;&lt;/html&gt;';

$dompdf = new DOMPDF();
$dompdf-&gt;load_html($html);

$dompdf-&gt;render();
$domper-&gt;stream("my_pdf.pdf", array("Attachment" =&gt; 0));

<? php pre>

<? php >See the <? php  href="usage.php#methodstream">class reference<? php a> for full details.<? php p>

<? php  href="#FAQ">[back to top]<? php a>
<? php iv class="divider2" style="background-position: 237px 0%">&nbsp;<? php div>

<? php  name="centre"> <? php a>
<? php 3>How do I centre a table, paragraph or div?<? php h3>

<? php >You can centre any block level element (table, p, div, ul, etc.) by
using margins:<? php p>

<? php re>
&lt;table style="margin-left: auto; margin-right: auto"&gt;
&lt;tr&gt;
&lt;td&gt; ... &lt;/td&gt;
&lt;/tr&gt;
&lt;/table&gt;
<? php pre>

<? php  href="#FAQ">[back to top]<? php a>
<? php iv class="divider1" style="background-position: 884px 0%">&nbsp;<? php div>

<? php div> <? php php include "foot.inc" ?>
