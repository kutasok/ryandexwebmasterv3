\name{ywGetUserAddedSitemaps}
\alias{ywGetUserAddedSitemaps}
\title{Get site added sitemaps from Yandex Webmaster}
\description{ywGetUserAddedSitemapInfo downloads added sitemaps from Yandex Webmaster API v 3.0}
\usage{
ywGetUserAddedSitemaps(user_id = NULL, host_id = NULL, offset = NULL, limit = NULL, token = NULL)
}

\arguments{
  \item{user_id}{User id from function ywGetUserId.}
  \item{host_id}{Host id of your site. You can get by function ywGetSitesList.}
  \item{offset}{Offset of sitemap index to start with.}
  \item{limit}{Limit of sitemaps in request result.}
  \item{token}{Token for Yandex Webmaster API from function ywGetToken}
}
\details{}
\value{Returns data frame with columns:
  sitemap_id - id of sitemap, 
  sitemap_url - url of sitemap, 
  added_date - date when sitemap was added to Yandex Webmaster by user, 
  count - quantity of sitemaps
}
\references{}
\author{Ivan Kutas}
\note{}

\seealso{}
\examples{
addedSitemaps <- ywGetUserAddedSitemaps(host_id=hostId, 
                                        user_id=userId, 
                                        token=myToken)
}

\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line



