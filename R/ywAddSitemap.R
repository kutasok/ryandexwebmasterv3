#Позволяет добавить файл sitemap в Яндекс.Вебмастер.
ywAddSitemap <- 
  function(user_id=NULL, host_id=NULL, sitemap_url=NULL, token=NULL){
    if(is.null(token)){
      warning("Get your api token by function ywGetToken() and argument token in function ywAddSitemap!");
      break
    }
    #Create POST request
    answer <- POST(paste("https://api.webmaster.yandex.net/v3/user/",
                         user_id,
                         "/hosts/",
                         host_id,
                         "/user-added-sitemaps/",sep = ""), 
                   add_headers(Authorization = paste0("OAuth ", token),
                               Content-type = "application/json"),
                   body = paste0("{\"url\": \"", 
                                 sitemap_url, 
                                 "}\""))
    
    #Send POST request
    stop_for_status(answer)
    
    #В случае успешного добавления сайта сервер возвращает 201 Created.
    
    dataRaw <- content(answer, "parsed", "application/json")
    
    return(dataRaw$sitemap_id)
  }