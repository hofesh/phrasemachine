#' @title Coarsen POS tags
#' @description Coarsens PTB or Petrov/Gimpel coarse tags into one of eight
#' categories:
#' 'A' = adjective, 'D' = determiner, 'P' = preposition,
#' 'N' = common/proper noun, 'M' = verb modifiers, 'V' = verbs,
#' 'C' = coordinating conjunction, 'O' = all else
#' NOTE: 'M', 'C', and 'V' tags are currently only compatible with the PTB tagset.
#' @param tag_vector A vector of POS tags.
#' @return A vector of coarse tags.
#' @examples
#' pos_tags <- c("VB", "JJ", "NN", "NN")
#' coarsen_POS_tags(pos_tags)
#' @export
coarsen_POS_tags <- function(tag_vector) {
    for (i in 1:length(tag_vector)) {
        if (tag_vector[i] %in% c("JJ","JJR","JJS","CoarseADJ", "CD", "CoarseNUM")) {
            tag_vector[i] <- "A"
        } else if (tag_vector[i] %in% c("DT","CoarseDET")) {
            tag_vector[i] <- "D"
        } else if (tag_vector[i] %in% c("IN", "TO", "CoarseADP")) {
            tag_vector[i] <- "P"
        } else if (tag_vector[i] %in% c("NN", "NNS", "NNP", "NNPS", "FW", "CoarseNOUN")) {
            tag_vector[i] <- "N"
        } else if (tag_vector[i] %in% c("RB", "RBR", "RBS", "RP", "MD")) {
            tag_vector[i] <- "M"
        } else if (tag_vector[i] %in% c("VB", "VBD", "VBG", "VBN", "VBP", "VBZ")) {
            tag_vector[i] <- "V"
        } else if (tag_vector[i] %in% c("CC")) {
            tag_vector[i] <- "C"
        } else {
            tag_vector[i] <- "O"
        }
    }
    return(tag_vector)
}
