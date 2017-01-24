# r-yandex-webmaster-v3 - пакет для работы с API Яндекс Вебмастера версии 3.0 на языке R.

#Краткое описание
Пакет r-yandex-webmaster-v3 помогает выгружать основные данные о сайтах пользователя Яндес Вебмастера.
Используется авторизация OAuth 2.0 для защиты данных.

#Установка пакета r-yandex-webmaster-v3
Установка пакета осуществляется из репозитория GitHub, для этого сначала требуется установить и подключить пакет devtools.

install.packages("devtools")

library(devtools)

После чего можно устанавливать пакет ryandexdirect.

install_github('kutasok/r-yandex-webmaster-v3')

#Функции входящие в пакет ryandexdirect
На данный момент в пакет входит 9 функций:

#ywGetToken()
Функция для получения токена для доступа к API Вебмастера, полученый токен используется во всех остальных функциях.

#ywGetUserId()

#ywGetSitesList()

#ywAddSite()

#ywDeleteSite()

#ywGetSiteInfo()

#ywGetSiteSummary()

#ywGetSiteBacklinks()

#ywGetSitePopQueries()


#Применение

token <- yadirGetToken()

user_id <- ywGetUserId(token=token)

sites_list <- ywGetSitesList(user_id=user_id, token=token)

siteInfo <- ywGetSiteInfo(host_id=sites_list$host_id[1], user_id=user_id, token=token)

siteSummary <- ywGetSiteSummary(host_id=sites_list$host_id[1], user_id=user_id, token=token)

siteBacklinks <- ywGetSiteBacklinks(host_id=sites_list$host_id[1], offset=50, limit=100, user_id=user_id, token=token)

sitePopQueries <- ywGetSitePopQueries(host_id=sites_list$host_id[1], user_id=user_id, token=token)





