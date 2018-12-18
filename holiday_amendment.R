library(timeDate)
library(lubridate)

fstart_date = '20150101'  # forecasting start date 
fend_date= '20151231'     # forecasting end date





holiday_data <-  data.frame(date=seq(as_date(fstart_date), as_date(fend_date), by = "day"))
holiday_data$day <- lubridate::day(holiday_data$date)
holiday_data$month <- lubridate::month(holiday_data$date)
holiday_data$wday <- lubridate::wday(holiday_data$date)

# holiday_data$weeks<- lubridate::week(holiday_data$date)

#### Some holidays using Pacakages 

holiday_data$New_year <- ifelse( as.character(holiday_data$date) %in% as.character(USNewYearsDay(2000:2025)) ,1,0)
holiday_data$Thanksgiving_day <- ifelse( as.character(holiday_data$date) %in% as.character( USThanksgivingDay(2000:2020)) ,1,0)
holiday_data$Labor_day <- ifelse( as.character(holiday_data$date) %in% as.character( USLaborDay(2000:2025)) ,1,0)
holiday_data$Easter_day <- ifelse( as.character(holiday_data$date) %in% as.character( Easter(2000:2025)) ,1,0)


#### Some holidays are coded using base packages 

holiday_data$Valentine_day <- ifelse(paste(holiday_data$day,holiday_data$month) %in% paste(14,2)  ,1,0)
holiday_data$july_4th <- ifelse(paste(holiday_data$day,holiday_data$month) %in% paste(4,7)  ,1,0)
holiday_data$patrick_day <- ifelse(paste(holiday_data$day,holiday_data$month) %in% paste(17,3)  ,1,0)
holiday_data$halloween <- ifelse(paste(holiday_data$day,holiday_data$month) %in% paste(31,10)  ,1,0)


holiday_data$father_day<- ifelse(holiday_data$date  == (holiday_data[which(holiday_data$month == '6' & holiday_data$wday =='1'),c("date")][3]),1,0)

holiday_data$mother_day <- ifelse(holiday_data$date  == (holiday_data[which(holiday_data$month == '5' & holiday_data$wday =='1'),c("date")][2]),1,0)




