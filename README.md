These scripts will download daily temperature data from the airports at these locations:

* Athens (AHN), GA, USA
* Knoxville (TYS), TN, USA
* Portland (PDX), OR, USA
* Tokyo (Narita), Japan
* Osaka (Itami), Japan
* New York (JFK), USA
* Jacksonville (JAX), FL, USA

Data are obtained from 1 Jan 2010 to 31 December 2014, and then the number of days with low temperature exceeding a critical threshhold variously set as 18, 21, or 24°C are counted. By counting those days, one is getting an index of how difficult it will be to produce high quality cool-season grass. This could be an index of summer intensity or summer length.

Charts are produced to show the data summarized by year and by city.

The `data` folder includes the downloaded data, so this can be run without rescraping all the data if desired.