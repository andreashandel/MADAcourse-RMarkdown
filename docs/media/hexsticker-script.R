#making a hex sticker for the course

library('hexSticker')
library('ggplot2')
library('here')

#ggplot2 example
#p <- ggplot(aes(x = mpg, y = wt), data = mtcars) + geom_point()
#img <- p + theme_void() + theme_transparent()
#sticker(img, package="MADA Course", p_size=20, s_x=1, s_y=.75, s_width=1.3, s_height=1, filename= here('media',"MADAlogo.png"))


img <- here('media',"analysis-workflow.png")
sticker(img, package="MADA Course", p_size=20, p_y = 1.3, s_x=1, s_y=.85, s_width=0.8, s_height=0.8, filename=here('media',"MADAlogo.png"), h_fill = "#003ffd30", h_color = "#0cc789ff")
