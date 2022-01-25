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

# Examples

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

## Number of PIN codes by State/UT
````
IndiaPIN %>% 
  group_by(State) %>% 
  summarise(Count = n()) %>% 
  arrange(desc(Count)) %>% 
  print(n = 40)
  
# A tibble: 36 × 2
   State                                        Count
   <chr>                                        <int>
 1 TAMIL NADU                                    2036
 2 UTTAR PRADESH                                 1652
 3 MAHARASHTRA                                   1585
 4 KERALA                                        1425
 5 KARNATAKA                                     1347
 6 ANDHRA PRADESH                                1228
 7 WEST BENGAL                                   1128
 8 GUJARAT                                       1007
 9 RAJASTHAN                                     1004
10 ODISHA                                         935
11 BIHAR                                          857
12 MADHYA PRADESH                                 770
13 TELANGANA                                      674
14 ASSAM                                          572
15 PUNJAB                                         534
16 HIMACHAL PRADESH                               436
17 JHARKHAND                                      380
18 HARYANA                                        315
19 UTTARAKHAND                                    300
20 CHHATTISGARH                                   274
21 JAMMU AND KASHMIR                              196
22 DELHI                                           97
23 GOA                                             88
24 TRIPURA                                         80
25 MEGHALAYA                                       68
26 MANIPUR                                         52
27 ARUNACHAL PRADESH                               49
28 MIZORAM                                         47
29 NAGALAND                                        43
30 CHANDIGARH                                      25
31 ANDAMAN AND NICOBAR ISLANDS                     22
32 PUDUCHERRY                                      22
33 SIKKIM                                          19
34 LADAKH                                          16
35 LAKSHADWEEP                                      9
36 THE DADRA AND NAGAR HAVELI AND DAMAN AND DIU     8
````

## Plotting on Map

I will use `leaflet` package to plot randomly selected 50 PIN codes. I am adding the Region and Circle name in the popup.

````
library(leaflet)
library(tidyverse)
library(IndiaPIN)

data("IndiaPIN")


index = sample(nrow(IndiaPIN), 50)

data = IndiaPIN::IndiaPIN[index,]

l1 = data$Longitude
l2 = data$Latitude
pop = paste(data$Region, data$Circle, sep = ", ")

m = leaflet() %>% 
   addTiles() %>% 
   addMarkers(lng=l1, lat=l2, popup = pop)

m
````
