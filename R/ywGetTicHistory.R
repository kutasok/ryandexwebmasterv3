#Позволяет получить историю изменения значений тИЦ сайта за последние 6 месяцев, 
#включая текущий. Для каждого месяца список содержит даты, когда тИЦ менял свое значение. 
#Если в какой-то из месяцев тИЦ не изменялся, то в списке будет одна запись для этого месяца 
#с актуальным значением тИЦ на тот момент.
ywGetTicHistory <- 
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
                        "/tic-history/?date_from=",
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
    
    resultData <- data.frame(date = as.Date(character()),
                             value = integer(),
                             stringsAsFactors=FALSE)
    
    

    for (i in 1:length(dataRaw$points)){
      try(resultData[i,1] <- dataRaw$points[[i]]$date, silent = TRUE)
      try(resultData[i,2] <- dataRaw$points[[i]]$value, silent = TRUE)
    }


    return(resultData)
  }