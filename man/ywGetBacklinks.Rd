\name{ywGetBacklinks}
\alias{ywGetBacklinks}
\title{Get site backlinks from Yandex Webmaster}
\description{ywDeleteSitemap downloads links from Yandex Webmaster via API v3.0.}
\usage{
ywGetBacklinks(user_id = NULL, host_id = NULL, offset = 0, limit = 100, token = NULL)
}
\arguments{
  \item{user_id}{User id from function ywGetUserId.}
  \item{host_id}{Host id of your site. You can get by function ywGetSitesList.}
  \item{offset}{Offset of link index to start from.}
  \item{limit}{Limit of links on request. Default is 100.}
  \item{token}{Token for Yandex Webmaster API from function ywGetToken}
}
\details{}
\value{Returns data frame with columns:
source_url - urls of backlink sourse,
destination_url - urls of backlinks targets,
discovery_date - date when yandex robots discovered links,
source_last_access_date - date of last acces by yandex robot
}
\references{}
\author{}
\note{}

\seealso{}
\examples{
siteBacklinks <- ywGetBacklinks(host_id=hostId, 
                                offset=50, 
                                limit=100, 
                                token=myToken)
}

\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
