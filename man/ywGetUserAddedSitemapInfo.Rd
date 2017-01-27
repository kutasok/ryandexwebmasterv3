\name{ywGetUserAddedSitemapInfo}
\alias{ywGetUserAddedSitemapInfo}
\title{Get site info about added sitemap from Yandex Webmaster}
\description{ywGetUserAddedSitemapInfo downloads added sitemap info from Yandex Webmaster API v 3.0}
\usage{
ywGetUserAddedSitemapInfo(user_id = NULL, host_id = NULL, sitemap_id = NULL, token = NULL)
}

\arguments{
  \item{user_id}{User id from function ywGetUserId.}
  \item{host_id}{Host id of your site. You can get by function ywGetSitesList.}
  \item{sitemap_id}{Id of itemap.}
  \item{token}{Token for Yandex Webmaster API from function ywGetToken}
}
\details{}
\value{Returns data frame with columns:
  sitemap_id - id of sitemap, 
  sitemap_url - url of sitemap, 
  added_date - date when sitemap was added to Yandex Webmaster bu user
}
\references{}
\author{Ivan Kutas}
\note{}

\seealso{}
\examples{
addedSitemapsInfo<- ywGetUserAddedSitemapInfo(host_id=hostid, 
                                              sitemap_id=addedSitemapId, 
                                              user_id=userId, 
                                              token=myToken)
}

\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
  
  
  
