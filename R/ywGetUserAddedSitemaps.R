#Позволяет получить список файлов sitemap, добавленных пользователем.
ywGetUserAddedSitemaps <- 
  function(user_id=NULL, host_id=NULL, offset=NULL, limit=NULL, token=NULL){
    if(is.null(token)){
      warning("Get your api token by function ywGetToken() and argument token in function ywGetUserAddedSitemaps!");
      break
    }
    #Create GET request
    answer <- GET(paste("https://api.webmaster.yandex.net/v3/user/",
                        user_id,
                        "/hosts/",
                        host_id,
                        "/user-added-sitemaps/?offset=",
                        offset,
                        "&limit=",
                        limit,
                        sep = ""), 
                  add_headers(Authorization = paste0("OAuth ", token))
    )
    
    #Send GET request
    stop_for_status(answer)
    
    #В случае успеха сервер возвращает 200 OK и список файлов sitemap пользователя.
    
    dataRaw <- content(answer, "parsed", "application/json")
    
    resultData <- data.frame(sitemap_id = character(),
                             sitemap_url = character(),
                             added_date = as.Date(character()),
                             count = integer(),
                             stringsAsFactors=FALSE)
    
    for (i in 1:length(dataRaw$sitemaps)){
      try(resultData[i,1] <- dataRaw$sitemaps[[i]]$sitemap_id, silent = TRUE)
      try(resultData[i,2] <- dataRaw$sitemaps[[i]]$sitemap_url, silent = TRUE)
      try(resultData[i,3] <- dataRaw$sitemaps[[i]]$added_date, silent = TRUE)
      try(resultData[i,4] <- dataRaw$count, silent = TRUE)
    }
    return(resultData)
  }