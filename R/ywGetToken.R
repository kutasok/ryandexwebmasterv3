#OAuth авторизация в Yandex Webmaster. Получение токена
ywGetToken <-
  function(){
    browseURL("https://oauth.yandex.ru/authorize?response_type=token&client_id=b8ab247215a44f0ea474417aaf4e6739")
    token <- readline(prompt = "Enter your token: ")
    return(token)
  }