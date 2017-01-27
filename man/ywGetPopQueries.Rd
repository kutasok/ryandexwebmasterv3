\name{ywGetPopQueries}
\alias{ywGetPopQueries}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
ywGetPopQueries(user_id = NULL, host_id = NULL, order_by = "TOTAL_CLICKS", token = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{user_id}{
%%     ~~Describe \code{user_id} here~~
}
  \item{host_id}{
%%     ~~Describe \code{host_id} here~~
}
  \item{order_by}{
%%     ~~Describe \code{order_by} here~~
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
function (user_id = NULL, host_id = NULL, order_by = "TOTAL_CLICKS", 
    token = NULL) 
{
    if (is.null(token)) {
        warning("Get your api token by function ywGetToken() and argument token in function ywGetPopQueries!")
        break
    }
    answer <- GET(paste("https://api.webmaster.yandex.net/v3/user/", 
        user_id, "/hosts/", host_id, "/search-queries/popular/?order_by=", 
        order_by, "&query_indicator=TOTAL_SHOWS&query_indicator=TOTAL_CLICKS&query_indicator=AVG_SHOW_POSITION&query_indicator=AVG_CLICK_POSITION", 
        sep = ""), add_headers(Authorization = paste0("OAuth ", 
        token)))
    stop_for_status(answer)
    dataRaw <- content(answer, "parsed", "application/json")
    resultData <- data.frame(date_from = as.Date(character()), 
        date_to = as.Date(character()), query_id = character(), 
        query_text = character(), indicators_total_shows = integer(), 
        indicators_total_clicks = integer(), indicators_avg_show_position = integer(), 
        indicators_avg_click_position = integer(), stringsAsFactors = FALSE)
    for (i in 1:length(dataRaw$queries)) {
        try(resultData[i, 1] <- dataRaw$date_from, silent = TRUE)
        try(resultData[i, 2] <- dataRaw$date_to, silent = TRUE)
        try(resultData[i, 3] <- dataRaw$queries[[i]]$query_id, 
            silent = TRUE)
        try(resultData[i, 4] <- dataRaw$queries[[i]]$query_text, 
            silent = TRUE)
        try(resultData[i, 5] <- dataRaw$queries[[i]]$indicators$TOTAL_SHOWS, 
            silent = TRUE)
        try(resultData[i, 6] <- dataRaw$queries[[i]]$indicators$TOTAL_CLICKS, 
            silent = TRUE)
        try(resultData[i, 7] <- dataRaw$queries[[i]]$indicators$AVG_SHOW_POSITION, 
            silent = TRUE)
        try(resultData[i, 8] <- dataRaw$queries[[i]]$indicators$AVG_CLICK_POSITION, 
            silent = TRUE)
    }
    return(resultData)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
