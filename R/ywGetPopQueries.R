#Позволяет получить список топ-500 поисковых запросов, по которым сайт показывался на поиске 
#за последнюю неделю. 
#Можно выбрать 500 запросов с наибольшим числом показов или 500 запросов с наибольшим числом переходов.
#Задается параметром order_by.
ywGetPopQueries <- 
  function(user_id=NULL, host_id=NULL, order_by="TOTAL_CLICKS", token=NULL){
    if(is.null(token)){
      warning("Get your api token by function ywGetToken() and argument token in function ywGetPopQueries!");
      break
    }
    #Create GET request
    answer <- GET(paste("https://api.webmaster.yandex.net/v3/user/",
                        user_id,
                        "/hosts/",
                        host_id,
                        "/search-queries/popular/?order_by=",
                        order_by,
                        "&query_indicator=TOTAL_SHOWS&query_indicator=TOTAL_CLICKS&query_indicator=AVG_SHOW_POSITION&query_indicator=AVG_CLICK_POSITION",
                        sep = ""), 
                  add_headers(Authorization = paste0("OAuth ", token))
    )
    
    #Send GET request
    stop_for_status(answer)
    
    #В случае успеха сервер возвращает 200 OK и список популярных поисковых запросов:
    
    dataRaw <- content(answer, "parsed", "application/json")
    
    resultData <- data.frame(date_from = as.Date(character()),
                             date_to = as.Date(character()),
                             query_id = character(),
                             query_text = character(),
                             indicators_total_shows = integer(),
                             indicators_total_clicks = integer(),
                             indicators_avg_show_position = integer(),
                             indicators_avg_click_position = integer(),
                             stringsAsFactors=FALSE)
    
    for (i in 1:length(dataRaw$queries)){
      try(resultData[i,1] <- dataRaw$date_from, silent = TRUE)
      try(resultData[i,2] <- dataRaw$date_to, silent = TRUE)
      try(resultData[i,3] <- dataRaw$queries[[i]]$query_id, silent = TRUE)
      try(resultData[i,4] <- dataRaw$queries[[i]]$query_text, silent = TRUE)
      try(resultData[i,5] <- dataRaw$queries[[i]]$indicators$TOTAL_SHOWS, silent = TRUE)
      try(resultData[i,6] <- dataRaw$queries[[i]]$indicators$TOTAL_CLICKS, silent = TRUE)
      try(resultData[i,7] <- dataRaw$queries[[i]]$indicators$AVG_SHOW_POSITION, silent = TRUE)
      try(resultData[i,8] <- dataRaw$queries[[i]]$indicators$AVG_CLICK_POSITION, silent = TRUE)
    }
    return(resultData)
  }