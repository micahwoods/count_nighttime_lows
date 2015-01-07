This is updated with more precise data obtained from:

* the [Climate Data Online](http://www.ncdc.noaa.gov/cdo-web/search) service of NOAA (USA)
* the [historical weather search (過去の気象データ検索)](http://www.data.jma.go.jp/obd/stats/etrn/index.php) service of the JMA (Japan)
* the [weather station directory](http://www.bom.gov.au/climate/data/stations/) of the BOM (Australia)

The `r/sanda_koshigaya.R` script will read in the data directly from the JMA site. One could change the station number and dates in the script to obtain data from other stations and on other dates.

These `r/weather_data_scrape.R` script will download daily temperature data from the airports at these locations:

* Athens (AHN), GA, USA
* Knoxville (TYS), TN, USA
* Portland (PDX), OR, USA
* Tokyo (Narita), Japan
* Osaka (Itami), Japan
* New York (JFK), USA
* Jacksonville (JAX), FL, USA

Data are obtained from 1 Jan 2010 to 31 December 2014, and then the number of days with low temperature exceeding a critical threshhold variously set as 18, 21, or 23°C are counted. By counting those days, one is getting an index of how difficult it will be to produce high quality cool-season grass. This could be an index of summer intensity or summer length.

Charts are produced to show the data summarized by year and by city. 

The `data` folder includes the downloaded data, so this can be run without rescraping all the data if desired.