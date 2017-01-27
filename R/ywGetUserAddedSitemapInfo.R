#Позволяет получить подробную информацию о файле sitemap, добавленном пользователем, 
#включая тип файла, дату и способ загрузки файла в Яндекс.Вебмастер, дату обработки файла сервисом, 
#количество содержащихся в файле URL, а также количество и тип обнаруженных ошибок.
ywGetUserAddedSitemapInfo <- 
  function(user_id=NULL, host_id=NULL, sitemap_id=NULL, token=NULL){
    if(is.null(token)){
      warning("Get your api token by function ywGetToken() and argument token in function ywGetUserAddedSitemapInfo!");
      break
    }
    #Create GET request
    answer <- GET(paste("https://api.webmaster.yandex.net/v3/user/",
                        user_id,
                        "/hosts/",
                        host_id,
                        "/user-added-sitemaps/",
                        sitemap_id,
                        "/",
                        sep = ""), 
                  add_headers(Authorization = paste0("OAuth ", token))
    )
    
    #Send GET request
    stop_for_status(answer)
    
    #В случае успеха сервер возвращает 200 OK и информацию о запрошенном файле sitemap.
    
    dataRaw <- content(answer, "parsed", "application/json")
    
    resultData <- data.frame(sitemap_id = character(),
                             sitemap_url = character(),
                             added_date = as.Date(character()),
                             stringsAsFactors=FALSE)
    

    try(resultData[1,1] <- dataRaw$sitemap_id, silent = TRUE)
    try(resultData[1,2] <- dataRaw$sitemap_url, silent = TRUE)
    try(resultData[1,3] <- dataRaw$added_date, silent = TRUE)

    return(resultData)
  }