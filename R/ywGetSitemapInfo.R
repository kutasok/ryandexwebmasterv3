#Позволяет получить подробную информацию о файле sitemap, включая тип файла, 
#дату и способ загрузки файла в Яндекс.Вебмастер, дату обработки файла сервисом, 
#количество содержащихся в файле URL, а также количество и тип обнаруженных ошибок.

##!!! Пока что API дает такой же результат как и для метода ywGetSitemaps(). 
##Лучше пока использовать метод ywGetSitemaps() с указанием parent_id.
ywGetSitemapInfo <- 
  function(user_id=NULL, host_id=NULL, sitemap_id=NULL, token=NULL){
    if(is.null(token)){
      warning("Get your api token by function ywGetToken() and argument token in function ywGetSitemapInfo!");
      break
    }
    #Create GET request
    answer <- GET(paste("https://api.webmaster.yandex.net/v3/user/",
                        user_id,
                        "/hosts/",
                        host_id,
                        "/sitemaps/?sitemap_id=",
                        sitemap_id,
                        sep = ""), 
                  add_headers(Authorization = paste0("OAuth ", token))
    )
    
    #Send GET request
    stop_for_status(answer)
    
    #В случае успеха сервер возвращает 200 OK и информацию о запрошенном файле sitemap.
    
    dataRaw <- content(answer, "parsed", "application/json")
    
    resultData <- data.frame(sitemap_id = character(),
                             sitemap_url = character(),
                             last_access_date = as.Date(character()),
                             errors_count = integer(),
                             urls_count = integer(),
                             children_count = integer(),
                             sources = character(),
                             sitemap_type = character(),
                             stringsAsFactors=FALSE)
    
    for (i in 1:length(dataRaw$sitemaps)){
      try(resultData[i,1] <- dataRaw$sitemaps[[i]]$sitemap_id, silent = TRUE)
      try(resultData[i,2] <- dataRaw$sitemaps[[i]]$sitemap_url, silent = TRUE)
      try(resultData[i,3] <- dataRaw$sitemaps[[i]]$last_access_date, silent = TRUE)
      try(resultData[i,4] <- dataRaw$sitemaps[[i]]$errors_count, silent = TRUE)
      try(resultData[i,5] <- dataRaw$sitemaps[[i]]$urls_count, silent = TRUE)
      try(resultData[i,6] <- dataRaw$sitemaps[[i]]$children_count, silent = TRUE)
      try(resultData[i,7] <- toString(dataRaw$sitemaps[[i]]$sources), silent = TRUE)
      try(resultData[i,8] <- dataRaw$sitemaps[[i]]$sitemap_type, silent = TRUE)
    }
    return(resultData)
  }