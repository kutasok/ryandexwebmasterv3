\name{ywDeleteSite}
\alias{ywDeleteSite}
\title{Delete site from Yandex Webmaster.}
\description{ywAddSite deletes site from Yandex Webmaster via API v3.0.}
\usage{
ywDeleteSite(user_id = NULL, host_id = NULL, token = NULL)
}
\arguments{
  \item{user_id}{User id from function ywGetUserId.}
  \item{host_id}{Host id of your site. You can get by function ywGetSitesList.}
  \item{token}{Token for Yandex Webmaster API from function ywGetToken}
}
\details{}
\value{Returns TRUE if site is deleted.}
\references{}
\author{Ivan Kutas}
\note{}

\seealso{}
\examples{
ywDeleteSite(user_id=userId, host_id=hostId, token=myToken)
}

\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
