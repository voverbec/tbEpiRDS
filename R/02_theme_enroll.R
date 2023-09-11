#' Create a customized ggplot theme for enrollment plots
#'
#' This function returns a custom ggplot theme that can be used to enhance the
#' visual appearance of enrollment plots. It includes customized settings for
#' axis text and legend position.
#'
#' @return A ggplot2 theme object.
#'
#' @export
#'
#' This function is part of the tbEpiRDS package, which is distributed under the
#' MIT License. See the LICENSE file for details.
#'
## Create own ggplot theme
theme_enroll <- function () {
    theme_bw() %+replace%
        theme(axis.text.x  = element_text(angle=45, hjust = 1, vjust = 1, color = "black"),
              legend.position = "bottom"
        )
}
