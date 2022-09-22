### purpose: this script goes through some quick and dirty essentials for reading in and processing data, to get you up to speed with the potential of R, and then gives a demonstration of R's capabilities for basic data processing and visualization
### date: 07/20/2022

# BACKGROUND ----

# this document is organized by headings - you can see an outline by clicking the # sign in the bottom left of this console

## COMMANDS ----

# this is a comment on a line of code - you can tell because it begins with #
# commands in R are written on one or multiple lines of code, and are run in the console, which appears in a window at the bottom of the screen
# this document is a script - scripts contain sequences of commands to fulfill a specific purpose. the purpose can be things like processing datasets and writing new datasets, or creating visualizations of datasets

# comments don't have any effect when they're run, but allow you to tell others and your future self what you're doing when you write commands
# test this - run this comment by highlighting it and hitting ctrl+enter
# you should see the comment appear in the console, at the bottom of the screen

# now highlight lines 1 to this line and run them - it runs each command in sequence

# you can write basic commands and run them in the console using operators you're likely familiar with
20
5 + 10
"address"
20 / 4
6 * 34
TRUE
FALSE
200 > 20
500 != 500
"address" == "addrss"
20 <= 40 & 30 != 50
20 <= 40 & "address" != "address"
(20 + 4) / 6
40 == 2 | 1 == 1
NA

# but some commands return errors 
4 + "address"
dog

dog <- 5

dog + 10

dog <- dog + 20

dog / 25

dog <- "assign"

cars_data <- mtcars

cars_data 

# and individual strings need to be continuous or in a vector (which we'll turn to later)
"address" "dog"

c("address", "dog")

# PREDICT: What will each of these lines return?
20 / 5 == 2 * 2
a <- 2 * 2 == 20 /5
a

"address" == 1

(1 == 1) & (1 == 1)

# TASK: Write a basic command and a comment

## OBJECT ASSIGNMENT AND FUNCTIONS ----

# the heart of programming in R lies in object-assignment and functions

# object assignment is when you assign a name to a value in R
# to assign something, you use the syntax objectname <- value

a <- 5
b <- 20 / 4
d <- "cactus"

# PREDICT - what happens when I run each command below
a
b
d
e
c

# you can then refer to the object by its assigned name in other commands
a + b
a / b

# you can also overwrite assignments
d <- a
b <- a + b
d <- b / a + 2

# you can also a assign series of values to an object, called a vector, using the c() function- we'll get more into this later
vec <- c("Dan", "Chris", "Tammy")

vec
numvec <- c(1, 6, 12, d)

# PREDICT - what does this return 
c(1, "dan", T) + 1
 
c(1, 142, 12)  + 12

# values in a vector must be of the same type - but values in a list can be of different types
list("Dan", 12, T, a)

# you can see a list of objects you've assigned and their values in the environment pane, in the top right of your screen

# object names must follow certain conventions - no spaces, cant start with numbers, no special characters - and should follow other conventions - all lowercase, descriptive, brief
good_name <- "Dan"
num_5 <- 5

bad object <- "Dan"
ThisIsABadNameforAnObjectBecauseItsTooLongAndViolatesOtherPractices <- "Chris"

# hit ctrl . 


# you can hit tab as you write an object name to automcomplete it
ThisIsABadNameforAnObjectBecauseItsTooLongAndViolatesOtherPractices

# PREDICT - what does this object name return?
12123dasdasd <- 5

# TASK - create an object storing your name


## FUNCTIONS -----

# functions are similar to what you would use in Excel - they are named commands that accept parameters - generally used in the format function(parameters) syntax
# functions are also objects - printing their names returns information about the object
print
sum
c

# but printing a function with parentheses tells it to run - and without required arguments, it returns an error 
print()

# r comes with a set of pre-loaded functions - and you're likely familiar with a lot of them from excel
print("address")
sum(2, 3, 5, d)
print(good_name)
c(good_name, "address")
mean(c(a, b, d))
paste0("dogs", dog, good_name)

# as you type a function - you can hit tab to start autocompleting the function - and also see text describing it, as well as the parameters to the function, and the package the function's in next to the function name
summary(ThisIsABadNameforAnObjectBecauseItsTooLongAndViolatesOtherPractices)
str(good_name)

str(cars_data)

summary(cars_data)

# often functions have parameters which allow the user to tweak how they behave - within a function, you can hit tab to see a list of parameters and text describing them. parameters are usually separated by commas within the function

# PREDICT - what will this return
sum(a, b, 5, NA)

sum(a, b, 5, NA, na.rm = T)


# TASK - rewrite the previous command to return the correct value

# you can still assign names to objects that share function names - although generally this isn't great practice

print <- "john"


# PREDICT: predict what each of these do. why do they behave this way?
print
print()
print("Dan")
print(print)

# you can also load in additional functions by installing packages - with install.packages("packagename") - and loading them into your script with the library function - with library(packagename) 
# the tidyverse is actually a collection of packages - including dplyr, stringr, ggplot, and purrr - that contain very helpful functions for working with data
library(tidyverse)

# here, we read in tidyverse midway through our script, but generally its good practice to read in all packages at the start of a script

# you can see the full list of functions in a package by typing its name, two colons, and hitting tab - even for the base package - you can then functionally "search" for pacakges in it by starting to type

utils::str
base::summary
dplyr::mutate

# you can also call functions this way - this is a good practice to help you learn what functions are stored in which packages. this is useful because if you haven't loaded the package, the fucntion won't run
base::print(a)

print(a)

utils::str(good_name)

str(good_name)

new_string <- stringr::str_replace(string = "Dan", pattern = "an", replacement = "ogs")

# str_replace


new_string

base::unique(c("Cat", "Cat", "cat", "Dog", "Dog", new_string))

base::tolower("CAPITALIZATION")

!(c(TRUE, FALSE))

# grepl - text matching - yes/no
base::grepl(x = "The Cat Barks", pattern = "Barks")
base::grepl(x = c("The Cat Barks", "fishmonger"), pattern = "fish")
!base::grepl(x = c("The Cat Barks", "fishmonger"), pattern = "fish")

# grep- returns position or value of string
base::grep(pattern = "the", x = c("the dogs", "The Dogs", "cat the fish", "there"))
base::grep(pattern = "the", x = c("dogs", "The Dogs", "cat the fish", "there"), ignore.case = T, value = T)
base::grep(pattern = "the", x = c("the dogs", "The Dogs", "cat the fish", "there"), invert = T)


# you can nest functions in functions - although there are better ways to write this/it can get difficult to read 
base::toupper(
  tolower(
    "CAPS"
  )
)

# better
stringr::str_to_title(
  base::toupper(
    base::tolower(
      "the dog walks alone at midnight"
    )
  )
)

# if you need help with a function, you can type ?functionname or ?packagename in the console. if you haven't loaded the package with the library function, you can still type ??functionname to search for help on it - and find out what package its in

# TASK: type ?group_by in the console
# TASK: type ?dplyr in the console
# TASK: type ??read.xlsx in the console

# TASK: use the c() function to assign a series of names to an object. find a function in the base:: package to order these alphabetically 


# DEMONSTRATION: WORKING WITH DATA -----

## READING IN AND PROCESSING DATA ----

# now that we've covered some of the very basics, this will be a quick demonstration of some of the capabilities of R to accomplish a lot of tasks that are more annoying with Excel

# to comment lots of things out - highlight it, hit ctrl+shift+c
# # we'll read in data on food inspections in montgomery county - https://data.montgomerycountymd.gov/Health-and-Human-Services/Food-Inspection/5pue-gfbe
# foodins <- read.csv("./data/Food_Inspection.csv")
# # we can also read it directly from the webpage
# foodins <- utils::read.csv("https://data.montgomerycountymd.gov/api/views/5pue-gfbe/rows.csv?accessType=DOWNLOAD")

# we'll read in data on residential permits in montgomery county - https://data.montgomerycountymd.gov/Licenses-Permits/Residential-Permit/m88u-pqki
# the . indicates the working directory - in a project, that's the working directory - good practice for reproducability
respermit <- utils::read.csv("./data/Residential_Permit.csv")

# respermit <- read.csv("~/r_proj/rtutorial/data/Residential_Permit.csv")

# this is a big dataset - lets try to get some basic info about it
utils::head(respermit, n = 20)

utils::str(respermit)

# looks like there are some odd values - negative valuations, missign zip codes
base::summary(respermit)

# per earlier, its better if column names are lowercase - so lets do that
respermit_mod <- dplyr::rename_all(respermit, base::tolower)

colnames(respermit_mod)

# there are some columns I don't fully know the meaning of - so lets find out the range of values
# this pulls out individual columns
respermit_mod$status
respermit_mod[["status"]]
dplyr::pull(respermit_mod, status)

# you can assign these to new objects if you want
statuscol <- respermit_mod$status

unique(respermit_mod$status)

# get frequency counts
base::summary(
  base::as.factor(
    pull(respermit_mod, application.type)
  )
)

base::summary(
  base::as.factor(
    pull(respermit_mod, work.type)
  )
)

# c(a, b) %>%
#   sum()

# dplyr loads a special infix function called the pipe, written like this - object %>% function()
## what it does is feed the object on the left hand side as the first unnamed argument to the right hand side
# so these two are equivalent - but the second is much easier to read
summary(as.factor(pull(.data = respermit_mod, var = status)))

respermit_mod %>%
  pull(status) %>%
  as.factor() %>%
  summary()

# another frequency count with this - can make the reference to the last object explicit by referring to it with .
respermit_mod %>%
  pull(use.code) %>%
  as.factor() %>%
  summary %>%
  # make parameter explicit - . now refers to modified respermit_mod
  sort(x = ., decreasing = T)

summary(respermit_mod$building.area)

# now - to show the capabilities of r - lets 1) filter out construct sheeting and shoring work-types and find out 2) the total construction permits by city, 2) the total and average valuation of A) construction permits by city and b) area by respermit_mod
permits_city <- respermit_mod %>%
  # remove this work type
  dplyr::filter(work.type != "CONSTRUCT SHEETING/SHORING") %>%
  # create categorical variable - based on building size
  dplyr::mutate(
    # case when is a form of if else that allows for multiple condtions read in sequence
    size_category = dplyr::case_when(
      building.area == 0 ~ "No area",
      building.area <= 500 ~ "<= 500 sq. ft",
      building.area <= 1000 ~ "500-1000 sq. ft",
      building.area <= 2000 ~ "1000-2000 sq. ft",
      # true means all other instances
      T ~ "Greater than 2000 sq. ft"
    ),
    # lets make this an ordered category - from small to high
    size_category = factor(size_category, 
                           levels = c("No area",  "<= 500 sq. ft", "500-1000 sq. ft", "1000-2000 sq. ft", "Greater than 2000 sq. ft"))
  ) %>%
  # count the total permits by city
  dplyr::group_by(city) %>%
  # mutate lets you create new columns- you can create multiple new columns by separating them with commas
  dplyr::mutate(city_totpermits = n(),
                city_totvaluation = sum(declared.valuation, na.rm = T),
                city_totarea = sum(declared.valuation, na.rm = T),
                city_meanvaluation = mean(declared.valuation, na.rm = T),
                city_meanarea = mean(building.area, na.rm = T),
                city_medianvaluation= median(declared.valuation, na.rm = T),
                city_medianarea = median(building.area))

# TASK - the code ran - but there are problems in it. identify the problems with the code above

# lets view what we just did- you can also see the dataframe by clicking on its name in the environment, or ctrl+clicking on the object name 
View(permits_city)

# TASK: View the dataframe below that just contains the building area and size category fields. What are the two issues with the category we've created?
permits_areacategory <- permits_city %>%
  # dplyr:: select - choose what columns want
  dplyr::select(size_category, building.area) %>%
  dplyr::arrange(desc(size_category))

# TASK: create a new variable in permits_city that is the sum of building.area and declared.valuation. Does anything unexpected happen? HINT: Try multiple ways of calculating the variable


## GROUPING DATA -----

# now - lets make a new dataframe that's grouped at the city and work-status level
workcity_summarized <- permits_city %>%
  # this isn't strictly necessary - but doing operations with daata you don't know is grouped often causes problems
  dplyr::ungroup() %>%
  # now group by city and work status, and the total variables we've created
  dplyr::group_by(city, status, city_totpermits, city_totvaluation, city_totarea) %>%
  # summarise collapses the dataset into the grouped dataset - like a pivot table
  dplyr::summarise(
    # across lets you create multiple new columns more efficiently - or modify existing columns more efficiently
    dplyr::across(
      # select columns want to do operations with
      .cols= c("declared.valuation", "building.area"), 
      # the functions we want to perform with this
      .fns = list(
        mean= ~ mean(.x, na.rm = T),
        # with ~ - call anonymous function- .x refers to column being modified
        median = ~ median(.x, na.rm = T),
        # names dont need match functions
        tot = ~ sum(.x, na.rm = T),
        min = ~ min(.x, na.rm = T),
        max = ~ max(.x, na.rm = T)
      ), 
      .names = "{col}_{fn}"
    ),
    totpermits = n()
  ) %>%
  # now lets find out percent vals
  dplyr::mutate(
    declared.valuation_pct = declared.valuation_tot / city_totvaluation,
    building.area_pct = building.area_tot / city_totarea,
    totpermits_pct= totpermits / city_totpermits
  )

# TASK: View the dataset we created to get familiar with it. create a new variable that shows the total valuation across all cities, and filter the city to Takoma Park, Silver Spring, and Rockville. HINT: %in% lets you check if a value is in a vector. Check the names for syntax. Assign the new dataset to city_subset












# # NEED DELETE
# city_subset <- workcity_summarized %>%
#   dplyr::group_by() %>%
#   dplyr::mutate(county_declared.valuation = sum(declared.valuation_tot, na.rm = T)) %>%
#   dplyr::filter(city %in% c("TAKOMA PARK", "SILVER SPRING", "ROCKVILLE"))


# maybe we want to play around with this dataset outside R. lets write it
write.csv(workcity_summarized, "./data/workcity_summarized.csv")
openxlsx::write.xlsx(workcity_summarized, file = "./data/workcity_summarized.xlsx", asTable = T, overwrite = T)


## QUICK REGRESSION EXAMPLE ----

# for reference - lets run a quick regression - https://www.learnbymarketing.com/tutorials/linear-regression-in-r/ - does work type predict valuation
statsobj <- stats::lm(formula = declared.valuation ~ work.type, data = respermit_mod %>% 
                        filter(!is.na(declared.valuation)))

summary(statsobj)

# what about work type and building area
statsobj <- stats::lm(formula = declared.valuation ~ work.type + building.area, data = respermit_mod %>% 
                        filter(!is.na(declared.valuation)))
summary(statsobj)

# good warning though - coding not replace stat knowledge


## PLOTTING DATA -----

# now lets make some plots - ggplot is the default plotting package. it's a little confusing/we don't have time to get into it today, but the documetnation is good. documentation can be found here - https://ggplot2.tidyverse.org/. I prefer to plot in plotly, but that's even more confusing to use
ggplot2::ggplot(city_subset, mapping = aes(x =  city, y = totpermits, fill = status)) +
  ggplot2::geom_col() + 
  ggplot2::ggtitle("Permits by type and city") +
  ggplot2::xlab("City") + 
  ggplot2::ylab("Total Permits")

# there are also options you can adjust
ggplot2::ggplot(city_subset, mapping = aes(x =  city, y = totpermits, fill = status)) +
  ggplot2::geom_col(position = "dodge2") + 
  ggplot2::ggtitle("Permits by type and city") +
  ggplot2::xlab("City") + 
  ggplot2::ylab("Total Permits")

  
# TASK: Make the first bar chart, but show the percent of permits that are each type instead


# now, lets demo the power of joining

# TASK - there is a file called "Demolitions_Permits (1) in the data folder. read it in as demo_city, group it by city, and summarise to calculate total demos
demo_permits <- read.csv("./data/Demolition_Permits (1).csv")









# # DON'T LOOK
# demo_city <- demo_permits %>%
#   dplyr::group_by(City) %>%
#   dplyr::summarise(totdemo = n())

## JOINING DATA ----

# now we can join the demo permits to the city subset dataset, and calcualte demolitions as a ratio of permits
city_data <- city_subset %>%
  dplyr::ungroup() %>%
  dplyr::select(city, city_totpermits) %>%
  # distinct- eliminates duplicate rows - we just want data each city
  dplyr::distinct()

# TASK: There are multiple ways to reach the same outcome in R. using the city_subset data, without using distinct, recreate the city_data file. HINT: you might want to group the data


# now we do a left 1:1 join of demo permits to the city data by the shared city field - they have different variable names, so in the vector we match the name of the joining field in each - with left-side = city_data name, right side = demo_permits name
city_permitsdemo <- city_data %>%
  dplyr::left_join(demo_city, by = c("city" = "City")) %>%
  dplyr::mutate(permitoverdemo = city_totpermits / totdemo)

# you could also join by multiple fields - this doesn't produce a very useful dataset, but is an example of a 1:many join - there are many matches in the right dataset of 
mutlimatch_permits <- city_subset %>%
  left_join(demo_permits, by = c("city" = "City", "status"= "Status"))

View(mutlimatch_permits)

# joining is where a lot of errors happen. it's important to understand the datasets that are being joined, and the fields in those datasets

# TASK - repeat the 1st join above - but replace left_join with each of the following - right_join, inner_join, full_join, and anti_join. What's the difference


## WORKING WITH SPATIAL DATA ----

# this is a real quick and dirty demo since some more interested in spatial side of data work

# install.packages("spdep", "sf", "leaflet")
library(spdep)
library(sf)
library(leaflet)

# going to read in spatial data on cemetary locations in county -  https://opendata-mcgov-gis.hub.arcgis.com/datasets/mcgov-gis::cemetery/explore?location=39.146618%2C-77.091463%2C11.49

county_cemeteries_df <- read.csv("./data/cemetery.csv")

head(county_cemeteries_df)
str(county_cemeteries_df)

# this is not currently a spatial dataset, but has latitude and longitude columns can use functions in sf package to make this a spatial dataset
cemeteries_spatial <- sf::st_as_sf(county_cemeteries_df, coords = c("LONGITUDE", "LATITUDE")) %>%
  # the CRS of a spatial dataframe is a confusing mapping concept that we don't have time to get into. but generally, you'll want to set the crs of spatial dataframes in R to 4326 for things to work 
  sf::st_set_crs(4326)

# now lets investigate this - motice that the class has changed, and now there's a geoemtry column
str(cemeteries_spatial)

# we can then save this as a spatial dataframe if we want to
sf::st_write(cemeteries_spatial, "./data/cemeteries_spatial.geojson")

# we can also use R to read in spatial data
cemeteries_spatial <- sf::st_read("./data/cemetery/cemetery.shp") %>%
  # it's still good practice to set the CRS
  sf::st_set_crs(4326)

# in many ways, we can treat this like a normal dataframe
cemeteries_spatial_mod <- cemeteries_spatial %>%
  # create random column
  dplyr::mutate(randomcol = base::sample(nrow(cemeteries_spatial), replace = T)) %>%
  dplyr::rename_all(tolower) %>%
  # filter out poolesville
  filter(!grepl("Poolesvill", city, ignore.case = T))

# we can use the leaflet package to make maps - this has a good tutorial - https://rstudio.github.io/leaflet/
cemmap <- leaflet::leaflet(cemeteries_spatial_mod) %>%
  leaflet::addTiles() %>%
  leaflet::addMarkers(group = "Cemetery locations") %>%
  leaflet::addCircleMarkers(group = "Cemetery locations clustered", clusterOptions = leaflet::markerClusterOptions()) %>%
  leaflet::addLayersControl(options = leaflet::layersControlOptions(collapsed = F), 
                            overlayGroups = c("Cemetery locations", "Cemetery locations clustered")) %>%
  leaflet::hideGroup("Cemetery locations clustered")

# and can save maps as well
htmlwidgets::saveWidget(cemmap, "cemmap.html")
