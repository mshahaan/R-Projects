stats = read.csv(file = file.choose(), header = T, sep = ",", 
                 stringsAsFactors = F)


#Hypothesis 1
meanm = mean(stats[stats$gender==1,]$tripduration)
meanm
varm = var(stats[stats$gender==1,]$tripduration)
stddevm = sd(stats[stats$gender==1,]$tripduration)
stddevm
meanf = mean(stats[stats$gender==2,]$tripduration)
meanf
varf = var(stats[stats$gender==2,]$tripduration)
varf
stddevf = sd(stats[stats$gender==2,]$tripduration)
stddevf
numm = length(stats[stats$gender==1,]$tripduration)
numf = length(stats[stats$gender==2,]$tripduration)

z = (meanf - meanm)/sqrt((stddevf^2/numf)+(stddevm^2/numm))
p = 1 - pnorm(z)

#Hypothesis 2
avg_age_long = mean(stats[stats$tripduration>=900,]$birth.year)
avg_age_long
var_long = var(stats[stats$tripduration>=900,]$birth.year)
sd_long = sd(stats[stats$tripduration>=900,]$birth.year)
avg_age_short = mean(stats[stats$tripduration<900,]$birth.year)
avg_age_short
var_short = var(stats[stats$tripduration<900,]$birth.year)
sd_short = sd(stats[stats$tripduration<900,]$birth.year)
num_long = length(stats[stats$tripduration>=900,]$birth.year)
num_short = length(stats[stats$tripduration<900,]$birth.year)

z2 = (avg_age_short-avg_age_long)/sqrt((sd_short^2/num_short)+(sd_long^2/num_long))
p2 = 1 - pnorm(z2)