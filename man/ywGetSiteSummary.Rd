\name{ywGetSiteSummary}
\alias{ywGetSiteSummary}
\title{Get site statistics from Yandex Webmaster}
\description{ywGetSiteSummary downloads site statistics from Yandex Webmaster API v 3.0}
\usage{
ywGetSiteSummary(user_id = NULL, host_id = NULL, token = NULL)
}

\arguments{
  \item{user_id}{User id from function ywGetUserId.}
  \item{host_id}{Host id of your site. You can get by function ywGetSitesList.}
  \item{token}{Token for Yandex Webmaster API from function ywGetToken}
}
\details{}
\value{Returns data frame with columns:
  tic - TIC,
  downloaded_pages_count - quantity of downloaded pages, 
  excluded_pages_count - quantity of excluded pages,
  searchable_pages_count - quantity of pages in live index,
  site_problems_fatal - quantity of fatal site problems,
  site_problems_critical - quantity of critical site problems,
  site_problems_possible_problem - quantity of possible site problems,
  site_problems_recommendation - quantity of recommendations
}
\references{}
\author{Ivan Kutas}
\note{}

\seealso{}
\examples{
siteSummary <- ywGetSiteSummary(host_id=hostId, 
                                token=token)
}

\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line    
