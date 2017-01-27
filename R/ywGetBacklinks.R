#Позволяет получить примеры внешних ссылок на страницы сайта.
ywGetBacklinks <- 
  function(user_id=NULL, host_id=NULL, offset=0, limit=100, token=NULL){
    if(is.null(token)){
      warning("Get your api token by function ywGetToken() and argument token in function ywGetBacklinks!");
      break
    }
    #Create GET request
    answer <- GET(paste("https://api.webmaster.yandex.net/v3/user/",
                        user_id,
                        "/hosts/",
                        host_id,
                        "/links/external/samples/?offset=",
                        offset,
                        "&limit=",
                        limit,
                        sep = ""), 
                  add_headers(Authorization = paste0("OAuth ", token))
    )
    
    #Send GET request
    stop_for_status(answer)
    
    #В случае успеха сервер возвращает 200 OK и список внешних ссылок:
    
    dataRaw <- content(answer, "parsed", "application/json")
    
    resultData <- data.frame(source_url = character(),
                             destination_url = character(),
                             discovery_date = as.Date(character()),
                             source_last_access_date = as.Date(character()),
                             stringsAsFactors=FALSE)
    
    for (i in 1:length(dataRaw$links)){
      try(resultData[i,1] <- dataRaw$links[[i]]$source_url, silent = TRUE)
      try(resultData[i,2] <- dataRaw$links[[i]]$destination_url, silent = TRUE)
      try(resultData[i,3] <- dataRaw$links[[i]]$discovery_date, silent = TRUE)
      try(resultData[i,4] <- dataRaw$links[[i]]$source_last_access_date, silent = TRUE)
    }
    return(resultData)
  }