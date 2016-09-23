<iso:pattern id="Rule22_UUInfo" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="mdui:UIInfo/mdui:DisplayName">
    <iso:assert test="string-length(normalize-space(text())) > 0">
"rule22E": { "Severity": "Error",
         "Message": "UIInfo must include a non-empty DisplayName",
    </iso:assert>
  </iso:rule>
</iso:pattern>