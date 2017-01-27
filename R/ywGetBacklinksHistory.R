#Позволяет получить историю изменения количества внешних ссылок на сайт.
ywGetBacklinksHistory <- 
  function(user_id=NULL, host_id=NULL, token=NULL){
    if(is.null(token)){
      warning("Get your api token by function ywGetToken() and argument token in function ywGetUserAddedSitemapInfo!");
      break
    }
    #Create GET request
    answer <- GET(paste("https://api.webmaster.yandex.net/v3/user/",
                        user_id,
                        "/hosts/",
                        host_id,
                        "/links/external/history/?indicator=LINKS_TOTAL_COUNT",
                        sep = ""), 
                  add_headers(Authorization = paste0("OAuth ", token))
    )
    
    #Send GET request
    stop_for_status(answer)
    
    #В случае успеха сервер возвращает 200 OK и информацию о запрошенном файле sitemap.
    
    dataRaw <- content(answer, "parsed", "application/json")
    
    resultData <- data.frame(date = as.Date(character()),
                             value = integer(),
                             stringsAsFactors=FALSE)
    
    
    
    for (i in 1:length(dataRaw$indicators$LINKS_TOTAL_COUNT)){
      try(resultData[i,1] <- dataRaw$indicators$LINKS_TOTAL_COUNT[[i]]$date, silent = TRUE)
      try(resultData[i,2] <- dataRaw$indicators$LINKS_TOTAL_COUNT[[i]]$value, silent = TRUE)
    }
    
    
    return(resultData)
  }