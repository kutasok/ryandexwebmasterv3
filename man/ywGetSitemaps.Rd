\name{ywGetSitemaps}
\alias{ywGetSitemaps}
\title{Get site sitemaps from Yandex Webmaster}
\description{ywGetSitemaps downloads site sitemaps from Yandex Webmaster API v 3.0}
\usage{
ywGetSitemaps(user_id = NULL, host_id = NULL, parent_id = NULL, limit = NULL, from = NULL, token = NULL)
}

\arguments{
  \item{user_id}{User id from function ywGetUserId.}
  \item{host_id}{Host id of your site. You can get by function ywGetSitesList.}
  \item{parent_id}{Parent sitemap id.}
  \item{limit}{Limit quantyty of results.}
  \item{from}{Offset of sitemap index to start with.}
  \item{token}{Token for Yandex Webmaster API from function ywGetToken}
}
\details{}
\value{Returns data frame with columns:
  sitemap_id - id of sitemap in Yandex Webmaster,
  sitemap_url - url of sitemap,
  last_access_date - date of last access by yandex robot,
  errors_count - quantity of sitemap errors,
  urls_count - quantity of urls in sitemap,
  children_count - quantity of children sitemaps if it is sitemap index file, 
  sources - sources where yandex found sitemaps, 
  sitemap_type - type of sitemap file
}
\references{}
\author{Ivan Kutas}
\note{}

\seealso{}
\examples{
siteSitemaps <- ywGetSitemaps(host_id=hostId, 
                              user_id=userId, 
                              token=myToken)
}

\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line   
