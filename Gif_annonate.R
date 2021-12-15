library(magick)

temperature <-c("2016-01-01",
"2016-01-09",
"2016-01-17",
"2016-01-25",
"2016-02-02",
"2016-02-10",
"2016-02-18",
"2016-02-26",
"2016-03-05",
"2016-03-13",
"2016-03-21",
"2016-03-29",
"2016-04-06",
"2016-04-14",
"2016-04-22",
"2016-04-30",
"2016-05-08",
"2016-05-16",
"2016-05-24",
"2016-06-01",
"2016-06-09",
"2016-06-17",
"2016-06-25",
"2016-07-03",
"2016-07-11",
"2016-07-19",
"2016-07-27",
"2016-08-04",
"2016-08-12",
"2016-08-20",
"2016-08-28",
"2016-09-05",
"2016-09-13",
"2016-09-21",
"2016-09-29",
"2016-10-07",
"2016-10-15",
"2016-10-23")
gif = "C:/Users/HP/Documents/Brahmaputra_river_dynamics1.gif"
dates = c(
  "1992",
  "1993",
  "1994",
  "1996",
  "1997",
  "1998",
  "2000",
  "2001",
  "2002",
  "2004",
  "2005",
  "2006",
  "2008",
  "2009",
  "2010",
  "2012",
  "2013")

dates <-c("2013",
          "2013",
          "2013",
          "2014",
          "2014",
          "2014",
          "2015",
          "2016",
          "2016",
          "2017",
          "2018",
          "2018")

river_date <- as.character(rep(1984:2018, each=2))
forward <- image_read(gif)
nframes <- length(forward)

animation <- image_animate(forward, fps = 2)
image_write(animation, path = sub('.gif', '_sized.gif', gif))
forward <- image_read("C:/Users/HP/Documents/Brahmaputra_river_dynamics1_sized.gif")

filled = c(forward[1])
comp = forward[1]
for(i in 2:nframes){
  comp = image_composite(comp,forward[i])
  filled = c(filled, comp)
}

for(i in 1:nframes){
  filled[i] = filled[i] %>%
    image_annotate(river_date[i], size = 36, color = "white", location = "+450+40", font="consolas", boxcolor = rgb(0,0,0)) #, boxcolor = rgb(0,0,0,0.4
}

image_write_gif(filled, path = sub('.gif', '_years.gif', gif), delay=0.5)
