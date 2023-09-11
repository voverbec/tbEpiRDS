#' Calculate overlap between activity spaces of participants
#'
#' This function calculates the overlap proportion between the activity spaces of
#' participants. It iterates through pairs of participants and computes the overlap
#' proportion for each pair.
#'
#' @param participants A vector of participant IDs.
#' @param prep A dataframe with participant IDs and location coordinates.
#'
#' @return A dataframe with participant pairs and their overlap proportions.
#'
#' @export
#'
#' This function is part of the tbEpiRDS package, which is distributed under the
#' MIT License. See the LICENSE file for details.
## prepare data and calculate overlap
calculate_overlap <- function(participants, prep) {
    num_participants <- length(participants)
    overlap_results <- data.frame(pid1 = numeric(),
                                  pid2 = numeric(),
                                  overlap_prop = numeric())

    for (i in 1:(num_participants - 1)) {
        for (j in (i + 1):num_participants) {
            pid1 <- participants[i]
            pid2 <- participants[j]

            # Get data for participant 1 and participant 2
            a <- prep %>% dplyr::filter(pid == pid1) %>% dplyr::select(lng, lat)
            b <- prep %>% dplyr::filter(pid == pid2) %>% dplyr::select(lng, lat)

            # Calculate the overlap proportion between activity spaces
            overlap_prop <- olp(a, b)

            # Store the results in the overlap_results data frame
            overlap_results <- rbind(overlap_results, data.frame(pid1 = pid1,
                                                                 pid2 = pid2,
                                                                 overlap_prop = overlap_prop))
        }
    }

    return(overlap_results)
}
