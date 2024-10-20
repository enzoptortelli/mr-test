extractResponseFromCookies <- function(cookies) {
  respostas_list <- cookies[names(cookies) %>% str_starts('mrResponse_')]
  respostas_numeric_list <- lapply(respostas_list, function(string) {
    string %>% str_split(pattern = '') %>% unlist() %>% as.numeric()
  })
  return(respostas_numeric_list)
}
