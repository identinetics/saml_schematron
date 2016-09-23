<iso:pattern id="Rule22_UUInfo" xmlns:iso="http://purl.oclc.org/dsdl/schematron" >
  <iso:rule context="mdui:UIInfo">
    <iso:assert test="mdui:DisplayName[string-length() &gt; 0]">
"rule22aE": { "Severity": "Error",
         "Message": "UIInfo must include a non-empty DisplayName",
    </iso:assert>
    <iso:assert test="mdui:Description[string-length() &gt; 0]">
"rule22bE": { "Severity": "Error",
         "Message": "UIInfo must include a non-empty Description",
    </iso:assert>
    <iso:assert test="mdui:Logo[string-length() &gt; 0]">
"rule22cE": { "Severity": "Error",
         "Message": "UIInfo must include a non-empty Logo URL",
    </iso:assert>
  </iso:rule>
</iso:pattern>
