#Позволяет удалить сайт из списка сайтов пользователя.
ywDeleteSite <- 
  function(user_id=NULL, host_id=NULL, token=NULL){
    if(is.null(token)){
      warning("Get your api token by function ywGetToken() and argument token in function ywAddSite!");
      break
    }
    #Create DELETE request
    answer <- DELETE(paste("https://api.webmaster.yandex.net/v3/user/",
                         user_id,
                         "/hosts/",
                         host_id,
                         sep = ""), 
                   add_headers(Authorization = paste0("OAuth ", token))
                   )
    
    #Send DELETE request
    stop_for_status(answer)
    #В случае успеха сервер возвращает 204. Тело ответа не передается.
    
    return(TRUE)
  }