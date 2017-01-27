#Позволяет добавить сайт в список сайтов пользователя.
ywAddSite <- 
  function(user_id=NULL, host=NULL, token=NULL){
    if(is.null(token)){
      warning("Get your api token by function ywGetToken() and argument token in function ywAddSite!");
      break
    }
    #Create POST request
    answer <- POST(paste("https://api.webmaster.yandex.net/v3/user/",
                        user_id,
                        "/hosts/",sep = ""), 
                  add_headers(Authorization = paste0("OAuth ", token)),
                  body = paste0("{\"host_url\": \"", 
                                host, 
                                "}\""))
    
    #Send POST request
    stop_for_status(answer)
    
    #В случае успешного добавления сайта сервер возвращает 201 Created и URI ресурса сайта.
    
    dataRaw <- content(answer, "parsed", "application/json")
    
    return(dataRaw$host_id)
  }