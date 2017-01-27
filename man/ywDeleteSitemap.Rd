\name{ywDeleteSitemap}
\alias{ywDeleteSitemap}
\title{Delete sitemap from Yandex Webmaster.}
\description{ywDeleteSitemap deletes sitemap of the site from Yandex Webmaster via API v3.0.}
\usage{
ywDeleteSitemap(user_id = NULL, host_id = NULL, sitemap_id = NULL, token = NULL)
}
\arguments{
  \item{user_id}{User id from function ywGetUserId.}
  \item{host_id}{Host id of your site. You can get by function ywGetSitesList.}
  \item{sitemap_id}{Id of sitemap to delete. Sitemap ids you can get by function ywGetSitemaps}
  \item{token}{Token for Yandex Webmaster API from function ywGetToken}
}
\details{}
\value{Returns TRUE if site is deleted.}
\references{}
\author{Ivan Kutas}
\note{}

\seealso{}
\examples{
ywDeleteSitemap(user_id = userId, host_id = hostId, sitemap_id = sitemapId, token = myToken)
}

\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
