first_var = 5 #R automatically detects data type

#class() gives data type
print(class(4)) #int / numeric
print(class(4L)) #another int
print(class(T)) #boolean / logical
print(class(1 + 4i)) #complex
print(class("Sample")) #character
print(class(charToRaw("Sample"))) #Raw bytes of char

is.integer(first_var) #checks if integer
is.numeric(first_var) #checks if numeric
#there are many more

#to concert to another data type
as.integer(first_var) #only if possible

#Arithmetic
sprintf("4 + 5 = %d", 4 + 5)
sprintf("4 - 5 = %d", 4 - 5)
sprintf("4 * 5 = %d", 4 * 5)
sprintf("4 / 5 = %1.3f", 4 / 5)
sprintf("5 %% 4 = %d", 5 %% 4)
sprintf("4^2 = %d", 4^2)
#Very similar to C

#vectors
numbers = c(3,2,1,0,8)
numbers #prints vector
numbers[1] #prints 1st element
#vectors are 1-based as opposed to 0-based in other languages
#number[1] = 3, numbers[2] = 2
length(numbers) #prints length of vector
numbers[length(numbers)] #last index
numbers[-1] #prints every element except negative value (1)
numbers[c(1, 2)] #this is a vector that tells what values to print
numbers[1:2] #same as above
numbers[4] = 7
numbers
numbers[c(4,5)] = 2 #changing values
numbers
sort(numbers) #sorts vector
#sequence
add3 = seq(from = 3, to = 27, by = 3)
add3 # 3 6 9 12 ... 24 27
evens = seq(from = 2, by = 2, length.out = 10)
evens # 2 4 6 8 10 12 14 16 18 20
sprintf("Is 4 in evens?: %s", 4 %in% evens) 
rep(x = 2, times = 5, each = 2) #repeat
rep(x= c(1,2,3), times = 2, each = 3)
one_to_20 = c(1:20)

#Relational Operations
is_even = one_to_20 %% 2 == 0
is_even #boolean array
just_evens = one_to_20[one_to_20 %% 2 == 0]
just_evens

dead = 1
if(dead) print("You are dead") #if works the same

#Switch works all in one function
grade = "C"
switch(grade, 
       "A" = print("Great"), 
       "B" = print("Good"),
       "C" = print("Ok"),
       "D" = print("Bad"),
       "F" = print("Terrible"),
       print("No such grade"))
switch(dead, 1 = print("You are Dead"), 0 = print())

#String
str1 = "This is a string"
nchar(str1) #number of chars in str1
cat("kill","yourself") #concatenates strings with a space in between
str2 = paste("co", "ol", sep = "") #another way to concatenate
str2
substr(x = str2, start = 3, stop = 4)
sub(pattern = "dead", replacement = "alive", x = "You are dead")
#substitutes a substring with another substring
gsub(pattern = "jaja", replacement = "haha", x = "jaja jaja")
#We can split a string into a vector / array
strVect = strsplit("A dog ran fast", " ")
strVect
#strsplit seperates a string by the given token

#Data Frame
playData = data.frame(name = c("Eli", "Phil", "Daniel"),
                      age = c(38, 60, 23),
                      stringsAsFactors = F)
playData
#n*n matrix of data
playData[1,1]
playData[1]
recordSaq = data.frame(name = "Saquon", age = 23)
playData = rbind(playData, recordSaq) #adds row
playData
sbw = c(2,1,0,0)
playData = cbind(playData, sbw)
playData
wonSB = playData[playData$sbw > 0,]
wonSB

#Repeat loop
num = 1
repeat{
  print(num)
  num = num + 1
  if(num > 5) break
}

#for
for(i in one_to_20) print(i)

#matrix
matrix1 = matrix(data = c(1,2,3,4), nrow = 2, ncol = 2)
matrix1 #automatically sorts data into matrix
#data vector should have enough elements to fill matrix
matrix2 = matrix(data = c(1,2,3,4), nrow = 2, ncol = 2, byrow = T)
matrix2
#byrow is F by default
#byrow = T means to fill matrix left to right instead of top to bottom
dim(matrix2) #gives dimensions of matrix
matrix3 = rbind(1:3, 4:6, 7:9)
matrix3
matrix3[1,] #gives entire first row

arr1 = array(data = 1:8, dim = c(2,2,2))
arr1

#Function
getSum = function(num1, num2){
  return(num1+num2)
}
sprintf("%d", getSum(5,5))
#there is a function that turns a var name into a function
#many arguments
getSumMult = function(...){
  numList = list(...)
  sum = 0
  for(i in numList){
    sum = sum + i
  }
  sum
}
getSumMult(1,2,3,4) # = 10

addFunc = list(
  add1 = function(x) x+1,
  add2 = function(x) x+2,
  add3 = function(x) x+3
)
addFunc$add2(5)

#Exception Handling ---- tryCatch() 

#File I/O
readData = read.table(file = file.choose(),
                      header = T, sep = " ",
                      na.strings = "'",
                      stringsAsFactors = F)
readData
#reads basic file in format that rmconsole prints in

#Plotting
xy1 = matrix(data = c(1,2,3,4,5,
                      1,2,3,4,5), nrow = 5, ncol = 5)
plot(xy1)
plot(xy1, type = "l") #line through points
plot(xy1, type = "b") #both line and points
plot(xy1, type = "o",
     main = "Plot", xlab = "x axis", 
     ylab = "y axis", 
     col = "steelblue") #same as b but no spaces between line and points
#More Plots
  #barplot()
  #hist()
  #pie()
  #dotchart()
  #mosaic()
