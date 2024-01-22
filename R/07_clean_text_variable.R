#' Clean text variable
#'
#' This function cleans a text variable by making responses all uppercase, trimming
#' leading and trailing spaces, reducing repeated whitespace inside the string,
#' and searching for a specified term to replace with a standardized name.
#'
#' @param variable A vector of text responses to be cleaned.
#' @param term_to_search The term to search for in the text variable.
#' @param std_name The standardized name to replace the found term with.
#'
#' @return A vector of cleaned text responses.
#'
#' @export
#'
#' This function is part of the tbEpiRDS package, which is distributed under the
#' MIT License. See the LICENSE file for details.

clean_text_variable <- function(variable, term_to_search, std_name) {
    # Check if stringr is installed, if not, install and load it
    if (!requireNamespace("stringr", quietly = TRUE)) {
        install.packages("stringr")
        library(stringr)
    } else {
        library(stringr)
    }

    # Make responses all upper case
    cleaned_variable <- str_to_upper(variable)

    # Trim leading & trailing space
    cleaned_variable <- str_trim(cleaned_variable, side = "both")

    # Reduce repeated whitespace inside string
    cleaned_variable <- str_squish(cleaned_variable)

    # Search for a term and replace with a standardized name
    cleaned_variable[cleaned_variable != "" & grepl(term_to_search, cleaned_variable, fixed = TRUE)] <- std_name

    return(cleaned_variable)
}

# Example usage:
data$sc_bar1_cleaned <- clean_text_variable(data$sc_bar1, "LOUNGE", "THE LOUNGE")
