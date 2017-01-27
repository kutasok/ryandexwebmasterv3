\name{ywGetSitemapInfo}
\alias{ywGetSitemapInfo}
\title{Get info about sitemap from Yandex Webmaster}
\description{ywGetSitemapInfo downloads info about sitemap from Yandex Webmaster API v 3.0}
\usage{
ywGetSitemapInfo(user_id = NULL, host_id = NULL, sitemap_id = NULL, token = NULL)
}

\arguments{
  \item{user_id}{User id from function ywGetUserId.}
  \item{host_id}{Host id of your site. You can get by function ywGetSitesList.}
  \item{sitemap_id}{Sitemap id from host. You can get by function siteSitemaps.}
  \item{token}{Token for Yandex Webmaster API from function ywGetToken}
}
\details{}
\value{Returns data frame with columns:
  sitemap_id - id of sitemap, 
  sitemap_url - url of sitemap, 
  last_access_date - dta of last access by yandex robot, 
  errors_count - quantity of sitemap errors, 
  urls_count - quantity of urls in sitemap, 
  children_count - quantity if children sitemaps if it is sitemap index file, 
  sources - sources where yandex found sitemaps, 
  sitemap_type - type of sitemap file
}
\references{}
\author{Ivan Kutas}
\note{}

\seealso{}
\examples{
sitemapInfo <- ywGetSitemapInfo(host_id=hostId, 
                                sitemap_id=sitemapId, 
                                user_id=userId, 
                                token=myToken)
}

\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line   
