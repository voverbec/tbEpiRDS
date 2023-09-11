#' Calculate activity space metrics for participants
#'
#' This function computes various metrics related to participants' activity spaces,
#' including convex hull area, greatest circle distance, and pairwise distance between
#' locations. It is useful for understanding geographical patterns in Tuberculosis (TB)
#' transmission.
#'
#' @param cd A dataframe with participant IDs and location coordinates.
#' @param uniq A vector of unique participant IDs.
#'
#' @return A dataframe with activity space metrics for each participant.
#'
#' @export
#'
#' This function is part of the tbEpiRDS package, which is distributed under the
#' MIT License. See the LICENSE file for details.
### activity space - convex hull ####
activity_space <- function(cd, uniq) {
    df <- data.frame(pid = numeric(length(uniq)),
                     cvh = numeric(length(uniq)),
                     gcd = numeric(length(uniq)),
                     m = numeric(length(uniq)))

    for (i in 1:length(uniq)) {
        cd_sub <- cd %>% dplyr::filter(pid == uniq[i])
        df$pid[i] <- cd_sub$pid
        df$cvh[i] <- round(CHullAreaEarth(cd_sub$lng, cd_sub$lat), 4) # calculate convex hull area (function is from GeoRange pkg)
        df$gcd[i] <- round(GCD(cd_sub$lng, cd_sub$lat), 4) # calculate largest distance between points in the activity space
        mm <- round(PWMatrix(CoordCollapse(cd_sub$lng, cd_sub$lat)), 4) # matrix of pairwise distance between locations
        df$m[i] <- round(mean(mm[upper.tri(mm)]), 4)
    }

    return(df)
}
