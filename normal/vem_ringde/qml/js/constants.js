

// --------------------------------------
// URLs
// --------------------------------------

// var URL_LIST = "http://api.missatsamtal.se/?action=list&format=xml"
var URL_LIST = "http://api.missatsamtal.se/?action=list&format=json"

var URL_NUMBER = "http://api.missatsamtal.se/?action=search&format=xml&numberOfCompanies=1" // + "&number=" + num



/*
Parametrar (post)
 action (post)
 format (json, xml) standard json
 number - endast siffror (måste anges)
 company - vilket företag som ringde (måste anges)
 comment - kommentar (måste anges)
 key - erhåller genom kontakt, se ovan
 test - anges bara vid testning, innebär att data ej sparas hos oss

Svar
 data/error - Vid fel data/ok - Allt ok

 */


// --------------------------------------
// sizes
// --------------------------------------

// fonts
var FONT_SIZE_LARGE = 48
var FONT_SIZE_NORMAL = 26
var FONT_SIZE_SMALL = 14

// --------------------------------------
// colors
// --------------------------------------

var COLOR_BG = "#000000"
var COLOR_FG = "#FFFFFF"
var COLOR_STYLE = "#339933"
var COLOR_BORDER = "#116011"
/*
  #FF0097, #A200FF, #00ABA9, #8CBF26, #A05000,
  #E671B8, #F09609, #1BA1E2, #E51400, #339933
*/

var COLOR_LCD_BG = "#808080"
var COLOR_LCD_FG = "#309030"
var COLOR_LCD_BORDER = "#AAAAAA"


// --------------------------------------
// text
// --------------------------------------

var APP_NAME = "Vem ringde?"
var APP_VERSION = "0.1.0"

