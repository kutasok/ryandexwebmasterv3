#Позволяет получить историю индексирования сайта роботами Яндекса.
ywGetIndexingHistory <- 
  function(user_id=NULL, host_id=NULL, date_from=NULL, date_to=NULL, token=NULL){
    if(is.null(token)){
      warning("Get your api token by function ywGetToken() and argument token in function ywGetUserAddedSitemapInfo!");
      break
    }
    #Create GET request
    answer <- GET(paste("https://api.webmaster.yandex.net/v3/user/",
                        user_id,
                        "/hosts/",
                        host_id,
                        "/indexing-history/?indexing_indicator=SEARCHABLE",
                        "&indexing_indicator=DOWNLOADED",
                        "&indexing_indicator=DOWNLOADED_2XX",
                        "&indexing_indicator=DOWNLOADED_3XX",
                        "&indexing_indicator=DOWNLOADED_4XX",
                        "&indexing_indicator=DOWNLOADED_5XX",
                        "&indexing_indicator=FAILED_TO_DOWNLOAD",
                        "&indexing_indicator=EXCLUDED",
                        "&indexing_indicator=EXCLUDED_DISALLOWED_BY_USER",
                        "&indexing_indicator=EXCLUDED_SITE_ERROR",
                        "&indexing_indicator=EXCLUDED_NOT_SUPPORTED",
                        "&date_from=",
                        date_from,
                        "&date_to=",
                        date_to,
                        sep = ""), 
                  add_headers(Authorization = paste0("OAuth ", token))
    )
    
    #Send GET request
    stop_for_status(answer)
    
    #В случае успеха сервер возвращает 200 OK и информацию о запрошенном файле sitemap.
    
    dataRaw <- content(answer, "parsed", "application/json")
    
    resultData <- data.frame(indicator = character(),
                             date = as.Date(character()),
                             value = integer(),
                             stringsAsFactors=FALSE)
    
    indicators <- names(dataRaw$indicators)
    
    for (i in 1:length(indicators)){
      interimData <- data.frame(indicator = character(),
                                date = as.Date(character()),
                                value = integer(),
                                stringsAsFactors=FALSE)
      for (j in 1:length(dataRaw$indicators[[i]])){
        try(interimData[j,1] <- indicators[i], silent = TRUE)
        try(interimData[j,2] <- dataRaw$indicators[[i]][[j]]$date, silent = TRUE)
        try(interimData[j,3] <- dataRaw$indicators[[i]][[j]]$value, silent = TRUE)
      }
      resultData <- rbind(resultData,interimData)
    }
    return(resultData)
  }