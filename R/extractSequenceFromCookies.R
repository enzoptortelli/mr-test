extractSequenceFromCookies <- function(cookies) {
  seqs_list <- cookies[names(cookies) %>% str_starts('mrTeste_')]
  seqs_numeric_list <- lapply(seqs_list, function(string) {
    string %>% str_split(pattern = '') %>% unlist() %>% as.numeric()
  })

  return(seqs_numeric_list)
}
