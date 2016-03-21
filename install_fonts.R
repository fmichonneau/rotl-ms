install_fonts <- function() {
    dir.create("~/.fonts")
    system("git clone https://github.com/fmichonneau/latex-fonts.git ~/.fonts")
    system("fc-cache -f -v")
}
