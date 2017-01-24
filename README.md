# r-yandex-webmaster-v3 - пакет для работы с API Яндекс Вебмастера версии 3.0 на языке R.

#Краткое описание
Пакет r-yandex-webmaster-v3 помогает выгружать основные данные о сайтах пользователя Яндес Вебмастера.
Используется авторизация OAuth 2.0 для защиты данных.

#Установка пакета r-yandex-webmaster-v3
Установка пакета осуществляется из репозитория GitHub, для этого сначала требуется установить и подключить пакет devtools.

install.packages("devtools")

library(devtools)

После чего можно устанавливать пакет r-yandex-webmaster-v3.

install_github('kutasok/r-yandex-webmaster-v3')

#Функции входящие в пакет r-yandex-webmaster-v3
На данный момент в пакет входит 9 функций:

#ywGetToken()
Функция для получения токена для доступа к API Вебмастера, полученый токен используется во всех остальных функциях.

#ywGetUserId(token=NULL)

#ywGetSitesList(user_id=NULL, token=NULL)

#ywAddSite(host, user_id=NULL, token=NULL)

#ywDeleteSite(host_id, user_id=NULL, token=NULL)

#ywGetSiteInfo(host_id, user_id=NULL, token=NULL)

#ywGetSiteSummary(host_id, user_id=NULL, token=NULL)

#ywGetSiteBacklinks(host_id, offset=0, limit=100, user_id=NULL, token=NULL)

#ywGetSitePopQueries(host_id, order_by="TOTAL_CLICKS", user_id=NULL, token=NULL)


#Применение

token <- yadirGetToken()

user_id <- ywGetUserId(token=token)

sites_list <- ywGetSitesList(user_id=user_id, token=token)

siteInfo <- ywGetSiteInfo(host_id=sites_list$host_id[1], user_id=user_id, token=token)

siteSummary <- ywGetSiteSummary(host_id=sites_list$host_id[1], user_id=user_id, token=token)

siteBacklinks <- ywGetSiteBacklinks(host_id=sites_list$host_id[1], offset=50, limit=100, user_id=user_id, token=token)

sitePopQueries <- ywGetSitePopQueries(host_id=sites_list$host_id[1], user_id=user_id, token=token)





