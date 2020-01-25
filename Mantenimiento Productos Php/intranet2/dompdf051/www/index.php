<? php php include("head.inc"); ?>

<? php iv id="toc">
<? php 2>On this page:<? php h2>
<? php l>
<? php php echo li_arrow() ?><? php  href="#overview">Overview<? php a><? php li>
<? php php echo li_arrow() ?><? php  href="#features">Features<? php a><? php li>
<? php php echo li_arrow() ?><? php  href="#limitations">Limitations<? php a><? php li>
<? php php echo li_arrow() ?><? php  href="#hacking">Hacking<? php a><? php li>
<? php ul>
<? php div>

<? php  name="overview"> <? php a>
<? php 2>Overview<? php h2>

<? php >dompdf is an HTML to PDF converter.  At its heart, dompdf is (mostly)
CSS2.1 compliant HTML layout and rendering engine written in PHP.  It is
a style-driven renderer: it will download and read external stylesheets,
inline style tags, and the style attributes of individual HTML elements.  It
also supports most presentational HTML attributes.<? php p>

<? php >PDF rendering is currently provided either by PDFLib (<? php 
href="http://www.pdflib.com">www.pdflib.com<? php a>) or by a bundled
version the R&amp;OS CPDF class written by Wayne Munro (<? php 
href="http://www.ros.co.nz/pdf/">www.ros.co.nz/pdf<? php a>).  (Some
performance related changes have been made to the R&amp;OS class,
however).  In order to use PDFLib with dompdf, the PDFLib PECL
extension is required.  Using PDFLib improves performance and reduces
the memory requirements of dompdf somewhat, while the R&amp;OS CPDF class,
though slightly slower, eliminates any dependencies on external PDF
libraries.<? php p>

<? php >dompdf was entered in the <? php 
href="http://www.zend.com/php5/contest/contest.php">Zend PHP 5
Contest<? php a> and placed 20th overall.<? php p>

<? php >Please note that dompdf works only with PHP 5.  There are no plans for
a PHP 4 port.  If your web host does not offer PHP 4, I suggest either pestering
them, or setting up your own PHP 5 box and using it to run dompdf.  Your scripts
on your web host can redirect PDF requests to your PHP 5 box.<? php p>

<? php  name="features"> <? php a>
<? php 2>Features<? php h2>

<? php l>

<? php i style="list-style-image: url('images/star_01.gif');">handles most
CSS2.1 properties, including @import, @media &amp; @page rules<? php li>

<? php i style="list-style-image: url('images/star_02.gif');">supports most
presentational HTML 4.0 attributes<? php li>

<? php i style="list-style-image: url('images/star_03.gif');">supports external
stylesheets, either on the local machine or through http/ftp (via
fopen-wrappers)<? php li>

<? php i style="list-style-image: url('images/star_04.gif');">supports complex
tables, including row &amp; column spans, separate &amp; collapsed border
models, individual cell styling, multi-page tables (no nested tables yet however)<? php li>

<? php i style="list-style-image: url('images/star_05.gif');">image
support (png, gif &amp; jpeg)<? php li>

<? php i style="list-style-image: url('images/star_01.gif');">no dependencies on
external PDF libraries, thanks to the R&amp;OS PDF class<? php li>

<? php i style="list-style-image: url('images/star_02.gif');">inline PHP
support.  See the section on <? php  href="usage.php#inline">inline PHP<? php a> for details.<? php li>
<? php ul>


<? php  name="limitations"> <? php a>
<? php 2>Limitations (Known Issues)<? php h2>

<? php l>

<? php i style="list-style-image: url('images/star_04.gif');">tables can not be
nested<? php li>

<? php i style="list-style-image: url('images/star_02.gif');">ordered lists are
currently unsupported.<? php li>

<? php i style="list-style-image: url('images/star_03.gif');'">absolute &amp; relative
positioning and floats do not work, yet.<? php li>

<? php i style="list-style-image: url('images/star_04.gif');">not particularly
tolerant to poorly-formed HTML or CSS input (using Tidy first may help)<? php li>

<? php i style="list-style-image: url('images/star_03.gif');">large files can
take a while to render<? php li>


<? php ul>

<? php  name="hacking"> <? php a>
<? php 2>Hacking<? php h2>

<? php >If you are interested in extending or modifying dompdf, please feel free
to contact me (Benj Carson) by email at <? php  style="white-space: nowrap"
href="mailto:dompdf%40digitaljunkies%2eca">dompdf at digitaljunkies.ca<? php a>.
Let me know what you'd like to try and I can perhaps point you to the
relevant sections of the source.  If you add some features, or fix
some bugs, please send me a patch and I'll include your changes in the main
distribution.<? php p>

<? php php include("foot.inc"); ?>
