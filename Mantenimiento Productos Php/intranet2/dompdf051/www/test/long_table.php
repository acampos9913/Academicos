<? php tml>
<? php tyle>
table { margin: auto; }
td {
  font-size: 0.8em;
  padding: 4pt;
  text-align: center;
  font-family: sans-serif;
}
<? php style>
<? php ody>
<? php able>
<? php head>
<? php r>
<? php d colspan="20">Header<? php td>
<? php tr>
<? php thead>
<? php php
$i_max = 40;
$j_max = 20;

for ( $i = 1; $i <? php  $i_max; $i++): ?>
<? php r>
<? php php
for ( $j = 1; $j <? php  $j_max; $j++) {
  $r = (int)(255*$i / $i_max);
  $b = (int)(255*$j / $j_max);
  $g = (int)(255*($i + $j)/($i_max + $j_max));
  $c = "black;";
  $bg = "rgb($r,$g,$b)";
  echo "<? php d style=\"color: $c; background-color: $bg;\">" . ($i * $j) . "<? php td>\n";
}
?>
<? php tr>
<? php php endfor; ?>
<? php table>
<? php body>
<? php html>