<? php php include("head.inc"); ?>
<? php iv id="toc">
<? php 2>On this page:<? php h2>
<? php l>
<? php php echo li_arrow() ?><? php  href="#usage">Usage<? php a><? php li>
<? php l><? php php echo li_arrow() ?><? php  href="#web">Invoking via the web<? php a><? php li>
    <? php php echo li_arrow() ?><? php  href="#cli">Invoking via the command line<? php a><? php li>
    <? php php echo li_arrow() ?><? php  href="#class">Using the dompdf class directly<? php a><? php li>
    <? php php echo li_arrow() ?><? php  href="#method_summary">dompdf class reference<? php a><? php li> 
<? php ul>
<? php php echo li_arrow() ?><? php  href="#inline">Inline PHP support<? php a><? php li>
<? php ul>
<? php div>

<? php  name="usage"> <? php a>
<? php 2>Usage<? php h2>

<? php >The dompdf.php script included in the distribution can be used both from
the <? php  href="#cli">command line<? php a> or via a <? php  href="#web">web browser<? php a>.
Alternatively, the dompdf class can be used <? php  href="#class">directly<? php a>.<? php p>

<? php  name="web"> <? php a>
<? php 3>Invoking dompdf via the web<? php h3>

<? php >The dompdf.php script is not intended to be an interactive page.  It
receives input parameters via $_GET and can stream a PDF directly to the
browser.  This makes it possible to embed links to the script in a page that
look like static PDF links, but are actually dynamically generated.  This
method is also useful as a redirection target.<? php p>

<? php >dompdf.php accepts the following $_GET variables:<? php p>

<? php able>
<? php r><? php d class="bar1" colspan="3">&nbsp;<? php td><? php tr>
<? php r>
<? php d class="input">input_file<? php td>  <? php d>required<? php td>

<? php d class="description">a rawurlencoded() path to the HTML file to process.  Remote files
(http/ftp) are supported if fopen wrappers are enabled.<? php td>
<? php tr>

<? php r>
<? php d class="input">paper<? php td>  <? php d>optional<? php td>

<? php d class="description">the paper size.  Defaults to 'letter' (unless the default has been
changed in dompdf_config.inc.php).  See include/pdf_adapter.cls.php, or
invoke dompdf.php on the command line with the -l switch for accepted paper
sizes.<? php td>
<? php tr>

<? php r>
<? php d class="input">orientation<? php td>  <? php d>optional<? php td>
<? php d class="description">'portrait' or 'landscape'.  Defaults to 'portrait'.<? php td>
<? php tr>

<? php r>
<? php d class="input">base_path<? php td>  <? php d>optional<? php td>

<? php d class="description">the base path to use when resolving relative links (images or CSS
files).  Defaults to the directory containing the file being accessed.
(This option is useful for pointing dompdf at your CSS files even though the
HTML file may be elsewhere.)<? php td>
<? php tr>

<? php r>
<? php d class="input">output_file<? php td>  <? php d>optional<? php td>

<? php d class="description">the rawurlencoded() name of the output file. Defaults to 'dompdf_out.pdf'.<? php td>
<? php tr>

<? php r>
<? php d class="input">save_file<? php td>  <? php d>optional<? php td>

<? php d class="description">If present (i.e. <? php ode>isset($_GET["save_file"]) == true');<? php code>),
output_file is saved locally, Otherwise the file is streamed directly to the client.<? php td>
<? php tr>

<? php r><? php d class="bar2" colspan="3">&nbsp;<? php td><? php tr>
<? php table>


<? php >One technique for generating dynamic PDFs is to generate dynamic HTML as you
normally would, except instead of displaying the output to the browser, you
use output buffering and write the output to a temporary file.  Once this
file is saved, you redirect to the dompdf.php script.  If you use a
templating engine like Smarty, you can simply do:<? php p>


<? php re>
&lt;?php
$tmpfile = tempnam("/tmp", "dompdf_");
file_put_contents($tmpfile, $smarty->fetch()); // Replace $smarty->fetch()
                                                // with your HTML string

$url = "dompdf.php?input_file=" . rawurlencode($tmpfile) . 
       "&amp;paper=letter&amp;output_file=" . rawurlencode("My Fancy PDF.pdf");

header("Location: http://" . $_SERVER["HTTP_HOST"] . "/$url");
?&gt;
<? php pre>

<? php >If you use any stylesheets, you may need to provide the
<? php ode>base_path<? php code> option to tell dompdf where to look for them, as they
are not likely relative to /tmp ;).<? php p>


<? php  name="cli"> <? php a>
<? php 3>Invoking dompdf via the command line<? php h3>

<? php >You can execute dompdf.php using the following command:<? php p>

<? php re>$ php -f dompdf.php -- [options]<? php pre>

<? php >(If you find yourself using only the cli interface, you can add
<? php ode>#!/usr/bin/php<? php code> as the first line of dompdf.php to invoke dompdf.php
directly.)<? php p>

<? php >dompdf.php is invoked as follows:<? php p>

<? php able>
<? php r><? php d class="bar1" colspan="2">&nbsp;<? php td><? php tr>
<? php r>
<? php d colspan="2" class="input">$ ./dompdf.php [options] html_file<? php td>
<? php tr>

<? php r>
<? php d colspan="2"><? php ode>html_file<? php code> can be a filename, a url if
fopen_wrappers are enabled, or the '-' character to read from standard input.<? php td>
<? php tr>

<? php r>
<? php d class="input">-h<? php td>
<? php d class="description">Show a brief help message<? php td>
<? php tr>

<? php r>
<? php d class="input">-l<? php td>
<? php d class="description">list available paper sizes<? php td>
<? php tr>

<? php r>
<? php d class="input">-p size<? php td>
<? php d class="description">paper size; something like 'letter', 'A4', 'legal', etc. Thee default is 'letter'<? php td>
<? php tr>

<? php r>
<? php d class="input">-o orientation<? php td>
<? php d class="description">either 'portrait' or 'landscape'.  Default is 'portrait'.<? php td>
<? php tr>

<? php r>
<? php d class="input">-b path<? php td>

<? php d class="description">the base path to use when resolving relative links
(images or CSS files). Default is the directory of html_file.<? php td>
<? php tr>

<? php r>
<? php d class="input">-f file<? php td>
<? php d class="description">the output filename.  Default is the input <? php ode>[html_file].pdf<? php code>.<? php td>
<? php tr>

<? php r>
<? php d class="input">-v<? php td>
<? php d class="description">verbose: display html parsing warnings and file not found errors.<? php td>
<? php tr>

<? php r>
<? php d class="input">-d<? php td>

<? php d class="description">very verbose: display oodles of debugging output;
every frame in the tree is printed to stdout.<? php td>
<? php tr>
<? php r><? php d class="bar2" colspan="2">&nbsp;<? php td><? php tr>

<? php table>

<? php >Examples:<? php p>

<? php re>
$ php -f dompdf.php -- my_resume.html
$ ./dompdf.php -b /var/www/ ./web_stuff/index.html
$ echo '&lt;html&gt;&lt;body&gt;Hello world!&lt;/body&gt;&lt;/html&gt;' | ./dompdf.php -
<? php pre>


<? php  name="class"> <? php a>
<? php 3>Using the dompdf class directly<? php h3>

<? php >Using the dompdf class directly is fairly straightforward:
<? php re>
&lt;?php
require_once("dompdf_config.inc.php");

$html =
  '&lt;html&gt;&lt;body&gt;'.
  '&lt;p&gt;Put your html here, or generate it with your favourite '.
  'templating system.&lt;/p&gt;'.
  '&lt;/body&gt;&lt;/html&gt;';

$dompdf = new DOMPDF();
$dompdf-&gt;load_html($html);
$dompdf-&gt;render();
$dompdf-&gt;stream("sample.pdf");

?&gt;
<? php pre><? php p>

<? php >Below is a summary of the methods available in the dompdf class.  For complete details,
see the <? php  href="http://www.digitaljunkies.ca/dompdf/doc/">API
documentation<? php a> for the class interface definition.<? php p>

<? php  name="method_summary"> <? php a>
<? php 3>Method Summary<? php h3>
<? php l class="method-summary">
<? php php echo li_arrow() ?><? php pan class="method-result">DOMPDF<? php span> <? php  href="#method__construct">__construct<? php a>()<? php li>
<? php php echo li_arrow() ?><? php pan class="method-result">string<? php span> <? php  href="#methodget_base_path">get_base_path<? php a>()<? php li>
<? php php echo li_arrow() ?><? php pan class="method-result">string<? php span> <? php  href="#methodget_host">get_host<? php a>()<? php li>
<? php php echo li_arrow() ?><? php pan class="method-result">string<? php span> <? php  href="#methodget_protocol">get_protocol<? php a>()<? php li>
<? php php echo li_arrow() ?><? php pan class="method-result">Frame_Tree<? php span> <? php  href="#methodget_tree">get_tree<? php a>()<? php li>
<? php php echo li_arrow() ?><? php pan class="method-result">void<? php span> <? php  href="#methodload_html">load_html<? php a>(<? php pan class="var-type">string<? php span> <? php pan class="var-name">$str<? php span>)<? php li>
<? php php echo li_arrow() ?><? php pan class="method-result">void<? php span> <? php  href="#methodload_html_file">load_html_file<? php a>(<? php pan class="var-type">string<? php span> <? php pan class="var-name">$file<? php span>)<? php li>
<? php php echo li_arrow() ?><? php pan class="method-result">string<? php span> <? php  href="#methodoutput">output<? php a>()<? php li>
<? php php echo li_arrow() ?><? php pan class="method-result">void<? php span> <? php  href="#methodrender">render<? php a>()<? php li>
<? php php echo li_arrow() ?><? php pan class="method-result">void<? php span> <? php  href="#methodset_base_path">set_base_path<? php a>(<? php pan class="var-type">string<? php span> <? php pan class="var-name">$path<? php span>)<? php li>
<? php php echo li_arrow() ?><? php pan class="method-result">void<? php span> <? php  href="#methodset_host">set_host<? php a>(<? php pan class="var-type">string<? php span> <? php pan class="var-name">$host<? php span>)<? php li>
<? php php echo li_arrow() ?><? php pan class="method-result">void<? php span> <? php  href="#methodset_paper">set_paper<? php a>(<? php pan class="var-type">string<? php span> <? php pan class="var-name">$size<? php span>, [<? php pan class="var-type">string<? php span> <? php pan class="var-name">$orientation<? php span> = "portrait"])<? php li>
<? php php echo li_arrow() ?><? php pan class="method-result">void<? php span> <? php  href="#methodset_protocol">set_protocol<? php a>(<? php pan class="var-type">string<? php span> <? php pan class="var-name">$proto<? php span>)<? php li>
<? php php echo li_arrow() ?><? php pan class="method-result">void<? php span> <? php  href="#methodstream">stream<? php a>(<? php pan class="var-type">string<? php span> <? php pan class="var-type">$filename<? php span>, [<? php pan class="var-type">mixed<? php span> <? php pan class="var-name">$options<? php span> = null])<? php li>
<? php ul>

<? php iv class="method-definition" style="background-position: 10px bottom;">
<? php  name="method__construct" id="__construct"><? php -- --><? php a>
<? php iv class="method-header">
  <? php pan class="method-title">Constructor __construct<? php span> (line <? php pan class="line-number">163<? php span>)
<? php div> 
<? php  class="short-description">Class constructor<? php p> 
  <? php iv class="method-signature">
    <? php pan class="method-result">DOMPDF<? php span>
    <? php pan class="method-name">__construct<? php span>()
  <? php div>
<? php div>

<? php iv class="method-definition"  style="background-position: 302px bottom;">
<? php  name="methodget_base_path" id="get_base_path"><? php -- --><? php a>
<? php iv class="method-header">
  <? php pan class="method-title">get_base_path<? php span> (line <? php pan class="line-number">227<? php span>)
<? php div> 
<? php  class="short-description">Returns the base path<? php p>
  <? php iv class="method-signature">
    <? php pan class="method-result">string<? php span>
    <? php pan class="method-name">get_base_path<? php span>()
  <? php div>
<? php div>

<? php iv class="method-definition" style="background-position: 710px bottom;">
<? php  name="methodget_canvas" id="get_canvas"><? php -- --><? php a>
<? php iv class="method-header">
    <? php pan class="method-title">get_canvas<? php span> (line <? php pan class="line-number">234<? php span>)
<? php div> 
<? php  class="short-description">Return the underlying Canvas instance (e.g. CPDF_Adapter, GD_Adapter)<? php p> 
  <? php iv class="method-signature">
    <? php pan class="method-result">Canvas<? php span>
    <? php pan class="method-name">get_canvas<? php span>()
  <? php div>

<? php div>

<? php iv class="method-definition"  style="background-position: 252px bottom;">
<? php  name="methodget_host" id="get_host"><? php -- --><? php a> 
  <? php iv class="method-header">
    <? php pan class="method-title">get_host<? php span> (line <? php pan class="line-number">220<? php span>)
  <? php div> 
<? php  class="short-description">Returns the base hostname<? php p>  
  <? php iv class="method-signature">
    <? php pan class="method-result">string<? php span>
    <? php pan class="method-name">get_host<? php span>()
  <? php div>

<? php div>

<? php iv class="method-definition" style="background-position: 498px bottom;">
<? php  name="methodget_protocol" id="get_protocol"><? php -- --><? php a>
<? php iv class="method-header">
  <? php pan class="method-title">get_protocol<? php span> (line <? php pan class="line-number">213<? php span>)
<? php div> 
<? php  class="short-description">Returns the protocol in use<? php p>
  <? php iv class="method-signature">
    <? php pan class="method-result">string<? php span>
    <? php pan class="method-name">get_protocol<? php span>()
  <? php div>

<? php div>

<? php iv class="method-definition" style="background-position: 39px bottom;">
<? php  name="methodget_tree" id="get_tree"><? php -- --><? php a>
<? php iv class="method-header">
  <? php pan class="method-title">get_tree<? php span> (line <? php pan class="line-number">182<? php span>)
<? php div> 
<? php  class="short-description">Returns the underlying Frame_Tree object<? php p>
  <? php iv class="method-signature">
    <? php pan class="method-result">Frame_Tree<? php span>
    <? php pan class="method-name">get_tree<? php span>()
  <? php div>

<? php div>

<? php iv class="method-definition" style="background-position: 653px bottom;">
<? php  name="methodload_html" id="load_html"><? php -- --><? php a>
<? php iv class="method-header">
  <? php pan class="method-title">load_html<? php span> (line <? php pan class="line-number">272<? php span>)
<? php div> 
<? php  class="short-description">Loads an HTML string<? php p>
<? php  class="description"><? php >Parse errors are stored in the global array _dompdf_warnings.<? php p><? php p>
  <? php iv class="method-signature">
    <? php pan class="method-result">void<? php span>
    <? php pan class="method-name">load_html<? php span>(<? php pan class="var-type">string<? php span>&nbsp;<? php pan class="var-name">$str<? php span>)
  <? php div>
  
   <? php l class="parameters">
   <? php i>
     <? php pan class="var-type">string<? php span>
     <? php pan class="var-name">$str<? php span><? php pan class="var-description">: HTML text to load<? php span><? php li>
   <? php ul>

<? php div>

<? php iv class="method-definition" style="background-position: 479px bottom;">
<? php  name="methodload_html_file" id="load_html_file"><? php -- --><? php a>
<? php iv class="method-header">
  <? php pan class="method-title">load_html_file<? php span> (line <? php pan class="line-number">245<? php span>)
<? php div> 
<? php  class="short-description">Loads an HTML file<? php p>
<? php  class="description"><? php >Parse errors are stored in the global array _dompdf_warnings.<? php p><? php p>
  <? php iv class="method-signature">
    <? php pan class="method-result">void<? php span>
    <? php pan class="method-name">load_html_file<? php span>(<? php pan class="var-type">string<? php span>&nbsp;<? php pan class="var-name">$file<? php span>)
  <? php div>
  
  <? php l class="parameters">
      <? php i>
    <? php pan class="var-type">string<? php span>
    <? php pan class="var-name">$file<? php span><? php pan class="var-description">: a filename or url to load<? php span><? php li>
    <? php ul>

<? php div>

<? php iv class="method-definition" style="background-position: 182px bottom;">
<? php  name="methodoutput" id="output"><? php -- --><? php a>
<? php iv class="method-header">
  <? php pan class="method-title">output<? php span> (line <? php pan class="line-number">451<? php span>)
<? php div> 
<? php  class="short-description">Returns the PDF as a string<? php p>
  <? php iv class="method-signature">
    <? php pan class="method-result">string<? php span>
    <? php pan class="method-name">output<? php span>()
  <? php div>

<? php div>

<? php iv class="method-definition" style="background-position: 741px bottom;">

<? php  name="methodrender" id="render"><? php -- --><? php a>
<? php iv class="method-header">
  <? php pan class="method-title">render<? php span> (line <? php pan class="line-number">373<? php span>)
<? php div> 
<? php  class="short-description">Renders the HTML to PDF<? php p>
  
  <? php iv class="method-signature">
    <? php pan class="method-result">void<? php span>
    <? php pan class="method-name">render<? php span>()
  <? php div>
<? php div>

<? php iv class="method-definition" style="background-position: 824px bottom;">
<? php  name="methodset_base_path" id="set_base_path"><? php -- --><? php a>
<? php iv class="method-header">
  <? php pan class="method-title">set_base_path<? php span> (line <? php pan class="line-number">206<? php span>)
<? php div> 
<? php  class="short-description">Sets the base path<? php p>
  <? php iv class="method-signature">
    <? php pan class="method-result">void<? php span>
    <? php pan class="method-name">set_base_path<? php span>(<? php pan class="var-type">string<? php span>&nbsp;<? php pan class="var-name">$path<? php span>)
  <? php div>
  
  <? php l class="parameters">
  <? php i>
    <? php pan class="var-type">string<? php span>
    <? php pan class="var-name">$path<? php span><? php li>
  <? php ul>

<? php div>

<? php iv class="method-definition" style="background-position: 519px bottom;">

<? php  name="methodset_host" id="set_host"><? php -- --><? php a>
<? php iv class="method-header">
  <? php pan class="method-title">set_host<? php span> (line <? php pan class="line-number">199<? php span>)
<? php div> 
 <? php  class="short-description">Sets the base hostname<? php p>
  
  <? php iv class="method-signature">
    <? php pan class="method-result">void<? php span>
    <? php pan class="method-name">set_host<? php span>(<? php pan class="var-type">string<? php span>&nbsp;<? php pan class="var-name">$host<? php span>)
  <? php div>
  
  <? php l class="parameters">
  <? php i>
     <? php pan class="var-type">string<? php span>
     <? php pan class="var-name">$host<? php span><? php li>
     <? php ul>
<? php div>

<? php iv class="method-definition"  style="background-position: 391px bottom;">
<? php  name="methodset_paper" id="set_paper"><? php -- --><? php a>
<? php iv class="method-header">
  <? php pan class="method-title">set_paper<? php span> (line <? php pan class="line-number">353<? php span>)
<? php div> 
<? php  class="short-description">Sets the paper size &amp; orientation<? php p>
  
  <? php iv class="method-signature">
    <? php pan class="method-result">void<? php span>
    <? php pan class="method-name">set_paper<? php span>(<? php pan class="var-type">string<? php span>&nbsp;<? php pan class="var-name">$size<? php span>, [<? php pan class="var-type">string<? php span>&nbsp;<? php pan class="var-name">$orientation<? php span> = <? php pan class="var-default">"portrait"<? php span>])
  <? php div>
  
  <? php l class="parameters">
  <? php i>
    <? php pan class="var-type">string<? php span>
    <? php pan class="var-name">$size<? php span><? php pan class="var-description">: 'letter', 'legal', 'A4', etc. See CPDF_Adapter::$PAPER_SIZES<? php span><? php li>
  <? php i>
    <? php pan class="var-type">string<? php span>
    <? php pan class="var-name">$orientation<? php span><? php pan class="var-description">: 'portrait' or 'landscape'<? php span><? php li>
  <? php ul>
<? php div>

<? php iv class="method-definition" style="background-position: 672px bottom;">
<? php  name="methodset_protocol" id="set_protocol"><? php -- --><? php a>
<? php iv class="method-header">
  <? php pan class="method-title">set_protocol<? php span> (line <? php pan class="line-number">192<? php span>)
<? php div> 
<? php  class="short-description">Sets the protocol to use (http://, file://, ftp:// etc.)<? php p>
  
  <? php iv class="method-signature">
    <? php pan class="method-result">void<? php span>
    <? php pan class="method-name">set_protocol<? php span>(<? php pan class="var-type">string<? php span>&nbsp;<? php pan class="var-name">$proto<? php span>)
  <? php div>
  
  <? php l class="parameters">
  <? php i>
    <? php pan class="var-type">string<? php span>
    <? php pan class="var-name">$proto<? php span><? php li>
  <? php ul>
<? php div>

<? php iv class="method-definition" style="background-position: 146px bottom;">
<? php  name="methodstream" id="stream"><? php -- --><? php a>
<? php iv class="method-header">
  <? php pan class="method-title">stream<? php span> (line <? php pan class="line-number">441<? php span>)
<? php div> 
<? php  class="short-description">Streams the PDF to the client<? php p>

<? php  class="description">

<? php >The file will always open a download dialog.  The options parameter
controls the output headers.  Accepted headers
are:<? php r/><? php r/>

'Accept-Ranges' =&gt; 1 or 0 - if this is not set to 1, then this
header is not included, off by default. This header seems to have
caused some problems despite the fact that it is supposed to solve
them, so I am leaving it off by default.<? php r/><? php r/>

'compress' = &gt; 1 or 0 - apply content stream compression, this is
on (1) by default<? php r/><? php r/>

'Attachment' =&gt; 1 or 0 - if 1, force the browser to open a download
dialog, on (1) by default<? php p>

<? php p>
  
  <? php iv class="method-signature">
    <? php pan class="method-result">void<? php span>
    <? php pan class="method-name">stream<? php span>(<? php pan class="var-type">string<? php span>&nbsp;<? php pan class="var-name">$filename<? php span>, [<? php pan class="var-type">array<? php span>&nbsp;<? php pan class="var-name">$options<? php span> = <? php pan class="var-default">null<? php span>])
  <? php div>
  
   <? php l class="parameters">
       <? php i>
     <? php pan class="var-type">string<? php span>
     <? php pan class="var-name">$filename<? php span><? php pan class="var-description">: the name of the streamed file<? php span>      <? php li>
       <? php i>
     <? php pan class="var-type">array<? php span>
     <? php pan class="var-name">$options<? php span><? php pan class="var-description">: header options (see above)<? php span>      <? php li>
     <? php ul>
<? php div>

<? php  name="inline"> <? php a>
<? php 2>Inline PHP Support<? php h2>

<? php >dompdf supports two varieties of inline PHP code.  All PHP evaluation is
controlled by the <? php ode>DOMPDF_ENABLE_PHP<? php code> configuration option.  If it is set to
false, then no PHP code is executed.  Otherwise, PHP is evaluated in two
passes:<? php p>

<? php >The first pass is useful for inserting dynamic data into your PDF.  You can
do this by embedding &lt;?php ?&gt; tags in your HTML file, as you would in a
normal .php file.  This code is evaluated prior to parsing the HTML, so you
can echo any text or markup and it will appear in the rendered PDF.<? php p>

<? php >The second pass is useful for performing drawing operations on the
underlying PDF class directly.  You can do this by embedding PHP code within
&lt;script type="text/php"&gt; &lt;/script&gt; tags.  This code is evaluated
during the rendering phase and you have access to a few internal objects and
operations.  In particular, the <? php ode>$pdf<? php code> variable is the current instance of
Canvas.  Using this object, you can write and draw directly on the
current page.  Using the <? php ode>Canvas::open_object()<? php code>,
<? php ode>Canvas::close_object()<? php code> and
<? php ode>Canvas::add_object()<? php code> methods, you can create text and
drawing objects that appear on every page of your PDF (useful for headers &amp;
footers).<? php p>

<? php >The following variables are defined for you during the second pass of PHP
execution:<? php p>
<? php re>
  $pdf         the current instance of Canvas
  $PAGE_NUM    the current page number
  $PAGE_COUNT  the total number of pages in the document
<? php pre>

<? php >For more complete documentation of the Canvas API, see the <? php 
href="http://www.digitaljunkies.ca/dompdf/doc/">API documentation<? php a>.<? php p>

<? php php include("foot.inc"); ?>
