\name{ywGetIndexingHistory}
\alias{ywGetIndexingHistory}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
ywGetIndexingHistory(user_id = NULL, host_id = NULL, date_from = NULL, date_to = NULL, token = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{user_id}{
%%     ~~Describe \code{user_id} here~~
}
  \item{host_id}{
%%     ~~Describe \code{host_id} here~~
}
  \item{date_from}{
%%     ~~Describe \code{date_from} here~~
}
  \item{date_to}{
%%     ~~Describe \code{date_to} here~~
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
function (user_id = NULL, host_id = NULL, date_from = NULL, date_to = NULL, 
    token = NULL) 
{
    if (is.null(token)) {
        warning("Get your api token by function ywGetToken() and argument token in function ywGetUserAddedSitemapInfo!")
        break
    }
    answer <- GET(paste("https://api.webmaster.yandex.net/v3/user/", 
        user_id, "/hosts/", host_id, "/indexing-history/?indexing_indicator=SEARCHABLE", 
        "&indexing_indicator=DOWNLOADED", "&indexing_indicator=DOWNLOADED_2XX", 
        "&indexing_indicator=DOWNLOADED_3XX", "&indexing_indicator=DOWNLOADED_4XX", 
        "&indexing_indicator=DOWNLOADED_5XX", "&indexing_indicator=FAILED_TO_DOWNLOAD", 
        "&indexing_indicator=EXCLUDED", "&indexing_indicator=EXCLUDED_DISALLOWED_BY_USER", 
        "&indexing_indicator=EXCLUDED_SITE_ERROR", "&indexing_indicator=EXCLUDED_NOT_SUPPORTED", 
        "&date_from=", date_from, "&date_to=", date_to, sep = ""), 
        add_headers(Authorization = paste0("OAuth ", token)))
    stop_for_status(answer)
    dataRaw <- content(answer, "parsed", "application/json")
    resultData <- data.frame(indicator = character(), date = as.Date(character()), 
        value = integer(), stringsAsFactors = FALSE)
    indicators <- names(dataRaw$indicators)
    for (i in 1:length(indicators)) {
        interimData <- data.frame(indicator = character(), date = as.Date(character()), 
            value = integer(), stringsAsFactors = FALSE)
        for (j in 1:length(dataRaw$indicators[[i]])) {
            try(interimData[j, 1] <- indicators[i], silent = TRUE)
            try(interimData[j, 2] <- dataRaw$indicators[[i]][[j]]$date, 
                silent = TRUE)
            try(interimData[j, 3] <- dataRaw$indicators[[i]][[j]]$value, 
                silent = TRUE)
        }
        resultData <- rbind(resultData, interimData)
    }
    return(resultData)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
