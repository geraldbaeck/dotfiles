#!/usr/local/bin/bash

# <bitbar.title>Connection Info</bitbar.title>
# <bitbar.version>v0.01</bitbar.version>
# <bitbar.author>Gerald Bäck</bitbar.author>
# <bitbar.author.github>geraldbaeck</bitbar.author.github>
# <bitbar.desc>Provides network status information about your Mac: Internal and external IPv4+IPv6 addresses, Whois information and Speedtest.net results.</bitbar.desc>
# <bitbar.dependencies>speedtest-cli</bitbar.dependencies>
# <bitbar.image>http://i.imgur.com/zFv3RvI.png</bitbar.image>
#
# This bitbar plugin is based on Network Info plugin by Raymond Kuiper
# see https://getbitbar.com/plugins/Network/netinfo.60s.sh


# Set path and Speedtest tmp file
PATH=/usr/local/bin:$PATH
SPEEDTEST="/tmp/speedtest.txt"


# Function to notify the user via Aple Script
notify () {
    osascript -e "display notification \"$1\" with title \"Netinfo\""
}

# If called with parameter "copy", copy the second parameter to the clipboard
if [ "$1" = "copy" ]; then
  # Copy to clipboard
  echo "$2" | pbcopy
  notify "Copied $2 to clipboard"
  exit 0
fi

# If called with parameter "speedtest", run speedtest-cli
if [ "$1" = "speedtest" ]; then
  # test if speedtest-cli is found
  if [[ "$(which speedtest-cli)" != "" ]]; then
    # Perform a speedtest
    if speedtest-cli --simple --share > "$SPEEDTEST"; then
      notify "Speedtest is finished"
    else
      notify "Speedtest failed"
    fi
  else
     notify "Speedtest-cli not found!"
  fi
  exit 0
fi

declare -A COUNTRIES
COUNTRIES["AD"]="🇦🇩"  # U+1F1E6 U+1F1E9	Andorra
COUNTRIES["AE"]="🇦🇪"  # U+1F1E6 U+1F1EA	United Arab Emirates
COUNTRIES["AF"]="🇦🇫"  # U+1F1E6 U+1F1EB	Afghanistan
COUNTRIES["AG"]="🇦🇬"  # U+1F1E6 U+1F1EC	Antigua and Barbuda
COUNTRIES["AI"]="🇦🇮"  # U+1F1E6 U+1F1EE	Anguilla
COUNTRIES["AL"]="🇦🇱"  # U+1F1E6 U+1F1F1	Albania
COUNTRIES["AM"]="🇦🇲"  # U+1F1E6 U+1F1F2	Armenia
COUNTRIES["AO"]="🇦🇴"  # U+1F1E6 U+1F1F4	Angola
COUNTRIES["AQ"]="🇦🇶"  # U+1F1E6 U+1F1F6	Antarctica
COUNTRIES["AR"]="🇦🇷"  # U+1F1E6 U+1F1F7	Argentina
COUNTRIES["AS"]="🇦🇸"  # U+1F1E6 U+1F1F8	American Samoa
COUNTRIES["AT"]="🇦🇹"  # U+1F1E6 U+1F1F9	Austria
COUNTRIES["AU"]="🇦🇺"  # U+1F1E6 U+1F1FA	Australia
COUNTRIES["AW"]="🇦🇼"  # U+1F1E6 U+1F1FC	Aruba
COUNTRIES["AX"]="🇦🇽"  # U+1F1E6 U+1F1FD	Åland Islands
COUNTRIES["AZ"]="🇦🇿"  # U+1F1E6 U+1F1FF	Azerbaijan
COUNTRIES["BA"]="🇧🇦"  # U+1F1E7 U+1F1E6	Bosnia and Herzegovina
COUNTRIES["BB"]="🇧🇧"  # U+1F1E7 U+1F1E7	Barbados
COUNTRIES["BD"]="🇧🇩"  # U+1F1E7 U+1F1E9	Bangladesh
COUNTRIES["BE"]="🇧🇪"  # U+1F1E7 U+1F1EA	Belgium
COUNTRIES["BF"]="🇧🇫"  # U+1F1E7 U+1F1EB	Burkina Faso
COUNTRIES["BG"]="🇧🇬"  # U+1F1E7 U+1F1EC	Bulgaria
COUNTRIES["BH"]="🇧🇭"  # U+1F1E7 U+1F1ED	Bahrain
COUNTRIES["BI"]="🇧🇮"  # U+1F1E7 U+1F1EE	Burundi
COUNTRIES["BJ"]="🇧🇯"  # U+1F1E7 U+1F1EF	Benin
COUNTRIES["BL"]="🇧🇱"  # U+1F1E7 U+1F1F1	Saint Barthélemy
COUNTRIES["BM"]="🇧🇲"  # U+1F1E7 U+1F1F2	Bermuda
COUNTRIES["BN"]="🇧🇳"  # U+1F1E7 U+1F1F3	Brunei Darussalam
COUNTRIES["BO"]="🇧🇴"  # U+1F1E7 U+1F1F4	Bolivia
COUNTRIES["BQ"]="🇧🇶"  # U+1F1E7 U+1F1F6	Bonaire, Sint Eustatius and Saba
COUNTRIES["BR"]="🇧🇷"  # U+1F1E7 U+1F1F7	Brazil
COUNTRIES["BS"]="🇧🇸"  # U+1F1E7 U+1F1F8	Bahamas
COUNTRIES["BT"]="🇧🇹"  # U+1F1E7 U+1F1F9	Bhutan
COUNTRIES["BV"]="🇧🇻"  # U+1F1E7 U+1F1FB	Bouvet Island
COUNTRIES["BW"]="🇧🇼"  # U+1F1E7 U+1F1FC	Botswana
COUNTRIES["BY"]="🇧🇾"  # U+1F1E7 U+1F1FE	Belarus
COUNTRIES["BZ"]="🇧🇿"  # U+1F1E7 U+1F1FF	Belize
COUNTRIES["CA"]="🇨🇦"  # U+1F1E8 U+1F1E6	Canada
COUNTRIES["CC"]="🇨🇨"  # U+1F1E8 U+1F1E8	Cocos (Keeling) Islands
COUNTRIES["CD"]="🇨🇩"  # U+1F1E8 U+1F1E9	Congo
COUNTRIES["CF"]="🇨🇫"  # U+1F1E8 U+1F1EB	Central African Republic
COUNTRIES["CG"]="🇨🇬"  # U+1F1E8 U+1F1EC	Congo
COUNTRIES["CH"]="🇨🇭"  # U+1F1E8 U+1F1ED	Switzerland
COUNTRIES["CI"]="🇨🇮"  # U+1F1E8 U+1F1EE	Côte D'Ivoire
COUNTRIES["CK"]="🇨🇰"  # U+1F1E8 U+1F1F0	Cook Islands
COUNTRIES["CL"]="🇨🇱"  # U+1F1E8 U+1F1F1	Chile
COUNTRIES["CM"]="🇨🇲"  # U+1F1E8 U+1F1F2	Cameroon
COUNTRIES["CN"]="🇨🇳"  # U+1F1E8 U+1F1F3	China
COUNTRIES["CO"]="🇨🇴"  # U+1F1E8 U+1F1F4	Colombia
COUNTRIES["CR"]="🇨🇷"  # U+1F1E8 U+1F1F7	Costa Rica
COUNTRIES["CU"]="🇨🇺"  # U+1F1E8 U+1F1FA	Cuba
COUNTRIES["CV"]="🇨🇻"  # U+1F1E8 U+1F1FB	Cape Verde
COUNTRIES["CW"]="🇨🇼"  # U+1F1E8 U+1F1FC	Curaçao
COUNTRIES["CX"]="🇨🇽"  # U+1F1E8 U+1F1FD	Christmas Island
COUNTRIES["CY"]="🇨🇾"  # U+1F1E8 U+1F1FE	Cyprus
COUNTRIES["CZ"]="🇨🇿"  # U+1F1E8 U+1F1FF	Czech Republic
COUNTRIES["DE"]="🇩🇪"  # U+1F1E9 U+1F1EA	Germany
COUNTRIES["DJ"]="🇩🇯"  # U+1F1E9 U+1F1EF	Djibouti
COUNTRIES["DK"]="🇩🇰"  # U+1F1E9 U+1F1F0	Denmark
COUNTRIES["DM"]="🇩🇲"  # U+1F1E9 U+1F1F2	Dominica
COUNTRIES["DO"]="🇩🇴"  # U+1F1E9 U+1F1F4	Dominican Republic
COUNTRIES["DZ"]="🇩🇿"  # U+1F1E9 U+1F1FF	Algeria
COUNTRIES["EC"]="🇪🇨"  # U+1F1EA U+1F1E8	Ecuador
COUNTRIES["EE"]="🇪🇪"  # U+1F1EA U+1F1EA	Estonia
COUNTRIES["EG"]="🇪🇬"  # U+1F1EA U+1F1EC	Egypt
COUNTRIES["EH"]="🇪🇭"  # U+1F1EA U+1F1ED	Western Sahara
COUNTRIES["ER"]="🇪🇷"  # U+1F1EA U+1F1F7	Eritrea
COUNTRIES["ES"]="🇪🇸"  # U+1F1EA U+1F1F8	Spain
COUNTRIES["ET"]="🇪🇹"  # U+1F1EA U+1F1F9	Ethiopia
COUNTRIES["FI"]="🇫🇮"  # U+1F1EB U+1F1EE	Finland
COUNTRIES["FJ"]="🇫🇯"  # U+1F1EB U+1F1EF	Fiji
COUNTRIES["FK"]="🇫🇰"  # U+1F1EB U+1F1F0	Falkland Islands (Malvinas)
COUNTRIES["FM"]="🇫🇲"  # U+1F1EB U+1F1F2	Micronesia
COUNTRIES["FO"]="🇫🇴"  # U+1F1EB U+1F1F4	Faroe Islands
COUNTRIES["FR"]="🇫🇷"  # U+1F1EB U+1F1F7	France
COUNTRIES["GA"]="🇬🇦"  # U+1F1EC U+1F1E6	Gabon
COUNTRIES["GB"]="🇬🇧"  # U+1F1EC U+1F1E7	United Kingdom
COUNTRIES["GD"]="🇬🇩"  # U+1F1EC U+1F1E9	Grenada
COUNTRIES["GE"]="🇬🇪"  # U+1F1EC U+1F1EA	Georgia
COUNTRIES["GF"]="🇬🇫"  # U+1F1EC U+1F1EB	French Guiana
COUNTRIES["GG"]="🇬🇬"  # U+1F1EC U+1F1EC	Guernsey
COUNTRIES["GH"]="🇬🇭"  # U+1F1EC U+1F1ED	Ghana
COUNTRIES["GI"]="🇬🇮"  # U+1F1EC U+1F1EE	Gibraltar
COUNTRIES["GL"]="🇬🇱"  # U+1F1EC U+1F1F1	Greenland
COUNTRIES["GM"]="🇬🇲"  # U+1F1EC U+1F1F2	Gambia
COUNTRIES["GN"]="🇬🇳"  # U+1F1EC U+1F1F3	Guinea
COUNTRIES["GP"]="🇬🇵"  # U+1F1EC U+1F1F5	Guadeloupe
COUNTRIES["GQ"]="🇬🇶"  # U+1F1EC U+1F1F6	Equatorial Guinea
COUNTRIES["GR"]="🇬🇷"  # U+1F1EC U+1F1F7	Greece
COUNTRIES["GS"]="🇬🇸"  # U+1F1EC U+1F1F8	South Georgia
COUNTRIES["GT"]="🇬🇹"  # U+1F1EC U+1F1F9	Guatemala
COUNTRIES["GU"]="🇬🇺"  # U+1F1EC U+1F1FA	Guam
COUNTRIES["GW"]="🇬🇼"  # U+1F1EC U+1F1FC	Guinea-Bissau
COUNTRIES["GY"]="🇬🇾"  # U+1F1EC U+1F1FE	Guyana
COUNTRIES["HK"]="🇭🇰"  # U+1F1ED U+1F1F0	Hong Kong
COUNTRIES["HM"]="🇭🇲"  # U+1F1ED U+1F1F2	Heard Island and Mcdonald Islands
COUNTRIES["HN"]="🇭🇳"  # U+1F1ED U+1F1F3	Honduras
COUNTRIES["HR"]="🇭🇷"  # U+1F1ED U+1F1F7	Croatia
COUNTRIES["HT"]="🇭🇹"  # U+1F1ED U+1F1F9	Haiti
COUNTRIES["HU"]="🇭🇺"  # U+1F1ED U+1F1FA	Hungary
COUNTRIES["ID"]="🇮🇩"  # U+1F1EE U+1F1E9	Indonesia
COUNTRIES["IE"]="🇮🇪"  # U+1F1EE U+1F1EA	Ireland
COUNTRIES["IL"]="🇮🇱"  # U+1F1EE U+1F1F1	Israel
COUNTRIES["IM"]="🇮🇲"  # U+1F1EE U+1F1F2	Isle of Man
COUNTRIES["IN"]="🇮🇳"  # U+1F1EE U+1F1F3	India
COUNTRIES["IO"]="🇮🇴"  # U+1F1EE U+1F1F4	British Indian Ocean Territory
COUNTRIES["IQ"]="🇮🇶"  # U+1F1EE U+1F1F6	Iraq
COUNTRIES["IR"]="🇮🇷"  # U+1F1EE U+1F1F7	Iran
COUNTRIES["IS"]="🇮🇸"  # U+1F1EE U+1F1F8	Iceland
COUNTRIES["IT"]="🇮🇹"  # U+1F1EE U+1F1F9	Italy
COUNTRIES["JE"]="🇯🇪"  # U+1F1EF U+1F1EA	Jersey
COUNTRIES["JM"]="🇯🇲"  # U+1F1EF U+1F1F2	Jamaica
COUNTRIES["JO"]="🇯🇴"  # U+1F1EF U+1F1F4	Jordan
COUNTRIES["JP"]="🇯🇵"  # U+1F1EF U+1F1F5	Japan
COUNTRIES["KE"]="🇰🇪"  # U+1F1F0 U+1F1EA	Kenya
COUNTRIES["KG"]="🇰🇬"  # U+1F1F0 U+1F1EC	Kyrgyzstan
COUNTRIES["KH"]="🇰🇭"  # U+1F1F0 U+1F1ED	Cambodia
COUNTRIES["KI"]="🇰🇮"  # U+1F1F0 U+1F1EE	Kiribati
COUNTRIES["KM"]="🇰🇲"  # U+1F1F0 U+1F1F2	Comoros
COUNTRIES["KN"]="🇰🇳"  # U+1F1F0 U+1F1F3	Saint Kitts and Nevis
COUNTRIES["KP"]="🇰🇵"  # U+1F1F0 U+1F1F5	North Korea
COUNTRIES["KR"]="🇰🇷"  # U+1F1F0 U+1F1F7	South Korea
COUNTRIES["KW"]="🇰🇼"  # U+1F1F0 U+1F1FC	Kuwait
COUNTRIES["KY"]="🇰🇾"  # U+1F1F0 U+1F1FE	Cayman Islands
COUNTRIES["KZ"]="🇰🇿"  # U+1F1F0 U+1F1FF	Kazakhstan
COUNTRIES["LA"]="🇱🇦"  # U+1F1F1 U+1F1E6	Lao People's Democratic Republic
COUNTRIES["LB"]="🇱🇧"  # U+1F1F1 U+1F1E7	Lebanon
COUNTRIES["LC"]="🇱🇨"  # U+1F1F1 U+1F1E8	Saint Lucia
COUNTRIES["LI"]="🇱🇮"  # U+1F1F1 U+1F1EE	Liechtenstein
COUNTRIES["LK"]="🇱🇰"  # U+1F1F1 U+1F1F0	Sri Lanka
COUNTRIES["LR"]="🇱🇷"  # U+1F1F1 U+1F1F7	Liberia
COUNTRIES["LS"]="🇱🇸"  # U+1F1F1 U+1F1F8	Lesotho
COUNTRIES["LT"]="🇱🇹"  # U+1F1F1 U+1F1F9	Lithuania
COUNTRIES["LU"]="🇱🇺"  # U+1F1F1 U+1F1FA	Luxembourg
COUNTRIES["LV"]="🇱🇻"  # U+1F1F1 U+1F1FB	Latvia
COUNTRIES["LY"]="🇱🇾"  # U+1F1F1 U+1F1FE	Libya
COUNTRIES["MA"]="🇲🇦"  # U+1F1F2 U+1F1E6	Morocco
COUNTRIES["MC"]="🇲🇨"  # U+1F1F2 U+1F1E8	Monaco
COUNTRIES["MD"]="🇲🇩"  # U+1F1F2 U+1F1E9	Moldova
COUNTRIES["ME"]="🇲🇪"  # U+1F1F2 U+1F1EA	Montenegro
COUNTRIES["MF"]="🇲🇫"  # U+1F1F2 U+1F1EB	Saint Martin (French Part)
COUNTRIES["MG"]="🇲🇬"  # U+1F1F2 U+1F1EC	Madagascar
COUNTRIES["MH"]="🇲🇭"  # U+1F1F2 U+1F1ED	Marshall Islands
COUNTRIES["MK"]="🇲🇰"  # U+1F1F2 U+1F1F0	Macedonia
COUNTRIES["ML"]="🇲🇱"  # U+1F1F2 U+1F1F1	Mali
COUNTRIES["MM"]="🇲🇲"  # U+1F1F2 U+1F1F2	Myanmar
COUNTRIES["MN"]="🇲🇳"  # U+1F1F2 U+1F1F3	Mongolia
COUNTRIES["MO"]="🇲🇴"  # U+1F1F2 U+1F1F4	Macao
COUNTRIES["MP"]="🇲🇵"  # U+1F1F2 U+1F1F5	Northern Mariana Islands
COUNTRIES["MQ"]="🇲🇶"  # U+1F1F2 U+1F1F6	Martinique
COUNTRIES["MR"]="🇲🇷"  # U+1F1F2 U+1F1F7	Mauritania
COUNTRIES["MS"]="🇲🇸"  # U+1F1F2 U+1F1F8	Montserrat
COUNTRIES["MT"]="🇲🇹"  # U+1F1F2 U+1F1F9	Malta
COUNTRIES["MU"]="🇲🇺"  # U+1F1F2 U+1F1FA	Mauritius
COUNTRIES["MV"]="🇲🇻"  # U+1F1F2 U+1F1FB	Maldives
COUNTRIES["MW"]="🇲🇼"  # U+1F1F2 U+1F1FC	Malawi
COUNTRIES["MX"]="🇲🇽"  # U+1F1F2 U+1F1FD	Mexico
COUNTRIES["MY"]="🇲🇾"  # U+1F1F2 U+1F1FE	Malaysia
COUNTRIES["MZ"]="🇲🇿"  # U+1F1F2 U+1F1FF	Mozambique
COUNTRIES["NA"]="🇳🇦"  # U+1F1F3 U+1F1E6	Namibia
COUNTRIES["NC"]="🇳🇨"  # U+1F1F3 U+1F1E8	New Caledonia
COUNTRIES["NE"]="🇳🇪"  # U+1F1F3 U+1F1EA	Niger
COUNTRIES["NF"]="🇳🇫"  # U+1F1F3 U+1F1EB	Norfolk Island
COUNTRIES["NG"]="🇳🇬"  # U+1F1F3 U+1F1EC	Nigeria
COUNTRIES["NI"]="🇳🇮"  # U+1F1F3 U+1F1EE	Nicaragua
COUNTRIES["NL"]="🇳🇱"  # U+1F1F3 U+1F1F1	Netherlands
COUNTRIES["NO"]="🇳🇴"  # U+1F1F3 U+1F1F4	Norway
COUNTRIES["NP"]="🇳🇵"  # U+1F1F3 U+1F1F5	Nepal
COUNTRIES["NR"]="🇳🇷"  # U+1F1F3 U+1F1F7	Nauru
COUNTRIES["NU"]="🇳🇺"  # U+1F1F3 U+1F1FA	Niue
COUNTRIES["NZ"]="🇳🇿"  # U+1F1F3 U+1F1FF	New Zealand
COUNTRIES["OM"]="🇴🇲"  # U+1F1F4 U+1F1F2	Oman
COUNTRIES["PA"]="🇵🇦"  # U+1F1F5 U+1F1E6	Panama
COUNTRIES["PE"]="🇵🇪"  # U+1F1F5 U+1F1EA	Peru
COUNTRIES["PF"]="🇵🇫"  # U+1F1F5 U+1F1EB	French Polynesia
COUNTRIES["PG"]="🇵🇬"  # U+1F1F5 U+1F1EC	Papua New Guinea
COUNTRIES["PH"]="🇵🇭"  # U+1F1F5 U+1F1ED	Philippines
COUNTRIES["PK"]="🇵🇰"  # U+1F1F5 U+1F1F0	Pakistan
COUNTRIES["PL"]="🇵🇱"  # U+1F1F5 U+1F1F1	Poland
COUNTRIES["PM"]="🇵🇲"  # U+1F1F5 U+1F1F2	Saint Pierre and Miquelon
COUNTRIES["PN"]="🇵🇳"  # U+1F1F5 U+1F1F3	Pitcairn
COUNTRIES["PR"]="🇵🇷"  # U+1F1F5 U+1F1F7	Puerto Rico
COUNTRIES["PS"]="🇵🇸"  # U+1F1F5 U+1F1F8	Palestinian Territory
COUNTRIES["PT"]="🇵🇹"  # U+1F1F5 U+1F1F9	Portugal
COUNTRIES["PW"]="🇵🇼"  # U+1F1F5 U+1F1FC	Palau
COUNTRIES["PY"]="🇵🇾"  # U+1F1F5 U+1F1FE	Paraguay
COUNTRIES["QA"]="🇶🇦"  # U+1F1F6 U+1F1E6	Qatar
COUNTRIES["RE"]="🇷🇪"  # U+1F1F7 U+1F1EA	Réunion
COUNTRIES["RO"]="🇷🇴"  # U+1F1F7 U+1F1F4	Romania
COUNTRIES["RS"]="🇷🇸"  # U+1F1F7 U+1F1F8	Serbia
COUNTRIES["RU"]="🇷🇺"  # U+1F1F7 U+1F1FA	Russia
COUNTRIES["RW"]="🇷🇼"  # U+1F1F7 U+1F1FC	Rwanda
COUNTRIES["SA"]="🇸🇦"  # U+1F1F8 U+1F1E6	Saudi Arabia
COUNTRIES["SB"]="🇸🇧"  # U+1F1F8 U+1F1E7	Solomon Islands
COUNTRIES["SC"]="🇸🇨"  # U+1F1F8 U+1F1E8	Seychelles
COUNTRIES["SD"]="🇸🇩"  # U+1F1F8 U+1F1E9	Sudan
COUNTRIES["SE"]="🇸🇪"  # U+1F1F8 U+1F1EA	Sweden
COUNTRIES["SG"]="🇸🇬"  # U+1F1F8 U+1F1EC	Singapore
COUNTRIES["SH"]="🇸🇭"  # U+1F1F8 U+1F1ED	Saint Helena, Ascension and Tristan Da Cunha
COUNTRIES["SI"]="🇸🇮"  # U+1F1F8 U+1F1EE	Slovenia
COUNTRIES["SJ"]="🇸🇯"  # U+1F1F8 U+1F1EF	Svalbard and Jan Mayen
COUNTRIES["SK"]="🇸🇰"  # U+1F1F8 U+1F1F0	Slovakia
COUNTRIES["SL"]="🇸🇱"  # U+1F1F8 U+1F1F1	Sierra Leone
COUNTRIES["SM"]="🇸🇲"  # U+1F1F8 U+1F1F2	San Marino
COUNTRIES["SN"]="🇸🇳"  # U+1F1F8 U+1F1F3	Senegal
COUNTRIES["SO"]="🇸🇴"  # U+1F1F8 U+1F1F4	Somalia
COUNTRIES["SR"]="🇸🇷"  # U+1F1F8 U+1F1F7	Suriname
COUNTRIES["SS"]="🇸🇸"  # U+1F1F8 U+1F1F8	South Sudan
COUNTRIES["ST"]="🇸🇹"  # U+1F1F8 U+1F1F9	Sao Tome and Principe
COUNTRIES["SV"]="🇸🇻"  # U+1F1F8 U+1F1FB	El Salvador
COUNTRIES["SX"]="🇸🇽"  # U+1F1F8 U+1F1FD	Sint Maarten (Dutch Part)
COUNTRIES["SY"]="🇸🇾"  # U+1F1F8 U+1F1FE	Syrian Arab Republic
COUNTRIES["SZ"]="🇸🇿"  # U+1F1F8 U+1F1FF	Swaziland
COUNTRIES["TC"]="🇹🇨"  # U+1F1F9 U+1F1E8	Turks and Caicos Islands
COUNTRIES["TD"]="🇹🇩"  # U+1F1F9 U+1F1E9	Chad
COUNTRIES["TF"]="🇹🇫"  # U+1F1F9 U+1F1EB	French Southern Territories
COUNTRIES["TG"]="🇹🇬"  # U+1F1F9 U+1F1EC	Togo
COUNTRIES["TH"]="🇹🇭"  # U+1F1F9 U+1F1ED	Thailand
COUNTRIES["TJ"]="🇹🇯"  # U+1F1F9 U+1F1EF	Tajikistan
COUNTRIES["TK"]="🇹🇰"  # U+1F1F9 U+1F1F0	Tokelau
COUNTRIES["TL"]="🇹🇱"  # U+1F1F9 U+1F1F1	Timor-Leste
COUNTRIES["TM"]="🇹🇲"  # U+1F1F9 U+1F1F2	Turkmenistan
COUNTRIES["TN"]="🇹🇳"  # U+1F1F9 U+1F1F3	Tunisia
COUNTRIES["TO"]="🇹🇴"  # U+1F1F9 U+1F1F4	Tonga
COUNTRIES["TR"]="🇹🇷"  # U+1F1F9 U+1F1F7	Turkey
COUNTRIES["TT"]="🇹🇹"  # U+1F1F9 U+1F1F9	Trinidad and Tobago
COUNTRIES["TV"]="🇹🇻"  # U+1F1F9 U+1F1FB	Tuvalu
COUNTRIES["TW"]="🇹🇼"  # U+1F1F9 U+1F1FC	Taiwan
COUNTRIES["TZ"]="🇹🇿"  # U+1F1F9 U+1F1FF	Tanzania
COUNTRIES["UA"]="🇺🇦"  # U+1F1FA U+1F1E6	Ukraine
COUNTRIES["UG"]="🇺🇬"  # U+1F1FA U+1F1EC	Uganda
COUNTRIES["UM"]="🇺🇲"  # U+1F1FA U+1F1F2	United States Minor Outlying Islands
COUNTRIES["US"]="🇺🇸"  # U+1F1FA U+1F1F8	United States
COUNTRIES["UY"]="🇺🇾"  # U+1F1FA U+1F1FE	Uruguay
COUNTRIES["UZ"]="🇺🇿"  # U+1F1FA U+1F1FF	Uzbekistan
COUNTRIES["VA"]="🇻🇦"  # U+1F1FB U+1F1E6	Vatican City
COUNTRIES["VC"]="🇻🇨"  # U+1F1FB U+1F1E8	Saint Vincent and The Grenadines
COUNTRIES["VE"]="🇻🇪"  # U+1F1FB U+1F1EA	Venezuela
COUNTRIES["VG"]="🇻🇬"  # U+1F1FB U+1F1EC	Virgin Islands, British
COUNTRIES["VI"]="🇻🇮"  # U+1F1FB U+1F1EE	Virgin Islands, U.S.
COUNTRIES["VN"]="🇻🇳"  # U+1F1FB U+1F1F3	Viet Nam
COUNTRIES["VU"]="🇻🇺"  # U+1F1FB U+1F1FA	Vanuatu
COUNTRIES["WF"]="🇼🇫"  # U+1F1FC U+1F1EB	Wallis and Futuna
COUNTRIES["WS"]="🇼🇸"  # U+1F1FC U+1F1F8	Samoa
COUNTRIES["YE"]="🇾🇪"  # U+1F1FE U+1F1EA	Yemen
COUNTRIES["YT"]="🇾🇹"  # U+1F1FE U+1F1F9	Mayotte
COUNTRIES["ZA"]="🇿🇦"  # U+1F1FF U+1F1E6	South Africa
COUNTRIES["ZM"]="🇿🇲"  # U+1F1FF U+1F1F2	Zambia
COUNTRIES["ZW"]="🇿🇼"  # U+1F1FF U+1F1FC	Zimbabwe

# Get external IPs
EXTERNAL_IP4=$(curl -4 -s https://icanhazip.com/ || echo None)
EXTERNAL_IP6=$(curl -6 --connect-timeout 10 -s http://v6.ipv6-test.com/api/myip.php || echo None)

# Perform whois lookup on the external IPv4 address.
[[ "$EXTERNAL_IP4" == "None" ]] && WHOIS="" || WHOIS=$(whois "$EXTERNAL_IP4")
[[ "$EXTERNAL_IP4" == "None" ]] && IP4_DESC="" || IP4_DESC=$(echo "$WHOIS" | awk '/descr: / {$1=""; print $0 }' | head -n 1)
[[ "$EXTERNAL_IP4" == "None" ]] && IP4_COUNTRY_CODE="" || IP4_COUNTRY_CODE=$(echo "$WHOIS" | awk '/country: / {$1=""; print $0 }' | head -n 1 | tr -d '[:space:]')
[[ "$EXTERNAL_IP4" == "None" ]] && IP4_COUNTRY_FLAG="$IP4_COUNTRY_CODE" || IP4_COUNTRY_FLAG=${COUNTRIES["${IP4_COUNTRY_CODE}"]}

# Find interfaces
INTERFACES=$(ifconfig | grep UP | egrep -o '(^en[0-9]*|^utun[0-9]*)' | sort -n)

# Start building output
[[ "$EXTERNAL_IP4" == "None" && "$EXTERNAL_IP6" == "None" ]]  && echo "❌" || echo ${IP4_COUNTRY_FLAG}
echo "---"
echo "🔄 Refresh | colo=black refresh=true"
echo "---"
echo "Public: "
echo "IPv4: ${EXTERNAL_IP4}${IP4_DESC} ${IP4_COUNTRY_CODE} | terminal=false bash='$0' param1=copy param2=$EXTERNAL_IP4"
echo "IPv6: ${EXTERNAL_IP6} | terminal=false bash='$0' param1=copy param2=$EXTERNAL_IP6"
echo "---"
echo "📈 Perform Speedtest | terminal=false refresh=true bash='$0' param1=speedtest"

# Pretty format the last speedtest if the tmp file is found
if [[ -e "$SPEEDTEST" ]]; then
     LAST=$(stat -f "%Sm" -t "%Y-%m-%d %H:%M:%S" "$SPEEDTEST")
     PING=$(awk '/Ping: / { $1=""; print $0 }' "$SPEEDTEST")
     UP=$(awk '/Upload: / { $1=""; print $0 }' "$SPEEDTEST")
     DOWN=$(awk '/Download: / { $1=""; print $0 }' "$SPEEDTEST")
     LINK=$(awk '/Share results: / { $1=""; $2=""; print $0 }' "$SPEEDTEST")
     echo "Last checked: $LAST"
     [[ "$PING" != "" ]] && echo "⏱$PING ▼$DOWN ▲$UP | href=$LINK"|| echo "No results..."
else
     echo "Last checked: Never"
fi

# Loop through the interfaces and output MAC, IPv4 and IPv6 information
echo "---"
for INT in $INTERFACES; do
     echo "$INT:"
     ifconfig "$INT" | awk "/ether/ { print \"MAC: \" \$2 \" | terminal=false bash='$0' param1=copy param2=\" \$2 }; /inet / { print \"IPv4: \" \$2 \" | terminal=false bash='$0' param1=copy param2=\" \$2 };  /inet6/ { print \"IPv6: \" \$2 \" | terminal=false bash='$0' param1=copy param2=\" \$2 }" | sed -e 's/%utun[0-9]*//g' -e 's/%en[0-9]*//g' | sort
     echo "---"
done

# EoF
