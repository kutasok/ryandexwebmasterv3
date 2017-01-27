\name{ywGetSiteSummary}
\alias{ywGetSiteSummary}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
ywGetSiteSummary(user_id = NULL, host_id = NULL, token = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{user_id}{
%%     ~~Describe \code{user_id} here~~
}
  \item{host_id}{
%%     ~~Describe \code{host_id} here~~
}
  \item{token}{
%%     ~~Describe \code{token} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (user_id = NULL, host_id = NULL, token = NULL) 
{
    if (is.null(token)) {
        warning("Get your api token by function ywGetToken() and argument token in function ywGetSiteSummary!")
        break
    }
    answer <- GET(paste("https://api.webmaster.yandex.net/v3/user/", 
        user_id, "/hosts/", host_id, "/summary/", sep = ""), 
        add_headers(Authorization = paste0("OAuth ", token)))
    stop_for_status(answer)
    dataRaw <- content(answer, "parsed", "application/json")
    resultData <- data.frame(tic = integer(), downloaded_pages_count = integer(), 
        excluded_pages_count = integer(), searchable_pages_count = integer(), 
        site_problems_fatal = integer(), site_problems_critical = integer(), 
        site_problems_possible_problem = integer(), site_problems_recommendation = integer(), 
        stringsAsFactors = FALSE)
    try(resultData[1, 1] <- dataRaw$tic, silent = TRUE)
    try(resultData[1, 2] <- dataRaw$downloaded_pages_count, silent = TRUE)
    try(resultData[1, 3] <- dataRaw$excluded_pages_count, silent = TRUE)
    try(resultData[1, 4] <- dataRaw$searchable_pages_count, silent = TRUE)
    try(resultData[1, 5] <- dataRaw$site_problems$FATAL, silent = TRUE)
    try(resultData[1, 6] <- dataRaw$site_problems$CRITICAL, silent = TRUE)
    try(resultData[1, 7] <- dataRaw$site_problems$POSSIBLE_PROBLEM, 
        silent = TRUE)
    try(resultData[1, 8] <- dataRaw$site_problems$RECOMMENDATION, 
        silent = TRUE)
    return(resultData)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
