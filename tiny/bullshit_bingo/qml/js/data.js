
var bs_swe = [ 
                 "ligga i framkant", "visa framfötterna", "incitament", "implementera", "kompetensutveckling",
                 "plattform", "segment", "måluppfyllelse",  "kvalitetssäkring", "samverkan", "resource", 
                 "humankapital", "kärnverksamhet", "initiera", "coaching", "företagskultur", "implementera", 
                 "certifiera", "kvalitetssäkra", "synergieffekt", "resultatorienterad", "Strukturkapital",
                 "Helhetssyn", "Vision", "Benchmark", "Kärnverksamhet" 
                 ];

var bs_eng = [
              "Patent", "Discovery", "Restructuring", "Guidance",
              "Reactivation", "Value", "Google", "Apple", "Mission statement",
              "Drill", "Functionality", "Customer oriented", "Performance",
              "Development", "Burn rate", "Facilitate", "Prioritized",
              "Monetise", "Big picture", "Deploy", "Management",
              "Opportunity", "B2B", "Benchmark", "Think outside the box",
              "Reach out", "Exposure", "Bottom up", "Top down",
              "Mission critical", "Flexible", "Growth", "Seamless",
              "Sustainable", "Strategy", "Real-time"
              ];

var getData = function(language)
{
    
    if( language == "swe") return bs_swe;
    
    return bs_eng;
}
