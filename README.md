# IndiaPIN
R dataset package of all India PIN Codes Directory with Latitude and Longitude Details (Updated: December 2021).

## What is this?
`IndiaPIN` contains geographic details about 19,300 PIN codes in India. Some PIN codes had more than one offices. Only the first office of that PIN code area has been retained in those cases. (Updated: December 2021)

## Variables
1. **Circle:** (chr) Name of the Postal Circle
2. **Region:** (chr) Name of the Postal Region
3. **Division:** (chr) Name of the Postal Division
4. **Office:** (chr) Name of Postal Office
5. **PIN:** (int) Six-digit PIN Code
6. **District:** (chr) Name of the District
7. **State:** (chr) Name of the State
8. **Latitude:** (dbl) Latitude
9. **Longitude:** (dbl) Longitude

### Data Source
Department of Posts, Ministry of Communications, Government of India. URL: https://www.indiapost.gov.in/vas/pages/findpincode.aspx. Wrangled for this package by Harshvardhan (https://harsh17.in/).

---

# Installation

````
# install `devtools` if not already installed
if (!require("IndiaPIN)) devtools::install_github("harshvardhaniimi/IndiaPIN")

# load IndiaPIN
library(IndiaPIN)
data(IndiaPIN)
````

# Example

## Variables
````
> head(IndiaPIN)
# A tibble: 6 × 9
# Groups:   PIN [6]
  Circle                Region         Division          Office        PIN District State  Latitude Longitude
  <chr>                 <chr>          <chr>             <chr>       <int> <chr>    <chr>     <dbl>     <dbl>
1 Andhra Pradesh Circle Kurnool Region Hindupur Division Peddakotl… 515631 ANANTAP… ANDHR…     14.6      77.9
2 Andhra Pradesh Circle Kurnool Region Hindupur Division Obularedd… 515581 ANANTAP… ANDHR…     14.2      78.3
3 Andhra Pradesh Circle Kurnool Region Hindupur Division Gurrambai… 515571 ANANTAP… ANDHR…     13.9      78.2
4 Andhra Pradesh Circle Kurnool Region Hindupur Division Hallikera… 515311 ANANTAP… ANDHR…     13.8      77.0
5 Andhra Pradesh Circle Kurnool Region Hindupur Division Tammadeha… 515281 ANANTAP… ANDHR…     14.1      77.0
6 Andhra Pradesh Circle Kurnool Region Hindupur Division Bussaiahg… 515241 ANANTAP… ANDHR…     14.0      77.7
````

## Number of PIN codes by state
````
IndiaPIN %>% 
  group_by(State) %>% 
  summarise(Count = n()) %>% 
  arrange(desc(Count)) %>% 
  print(n = 40)
````

More examples will be added in time.
