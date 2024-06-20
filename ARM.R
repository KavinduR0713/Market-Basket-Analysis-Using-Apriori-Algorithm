marketbasket = read.csv("marketbasket.csv", header = TRUE, colClasses = "factor")

names(marketbasket)                        
head(marketbasket)
tail(marketbasket)
summary(marketbasket)
str(marketbasket)

dim(marketbasket)

yes = colSums(marketbasket=="Yes")
yes

no = colSums(marketbasket=="No")
no

purchased = rbind(yes, no)

#Plot 1 
barplot(purchased, legend=rownames(purchased))

#Plot 2
barplot(purchased, beside = T, legend= rownames(purchased))

rules = apriori(marketbasket)

summary(rules)

inspect(rules)

rules = apriori(marketbasket, parameter = list(minlen=2, maxlen=3, conf=0.95) )

summary(rules)

inspect(rules)

summary(marketbasket)

barplot(purchased, beside = T, legend=rownames(purchased))
#According to the plot cosmetics are the most popular items.

rules = apriori(marketbasket,
                parameter = list(minlen=2, maxlen=3, conf=0.95),
                appearance = list(rhs=c("cosmetics=Yes"), default = "lhs") )

summary(rules)

inspect(rules)
# There are no rules available for given parameter values

rules = apriori(marketbasket,
                parameter = list(minlen=2, maxlen=3, conf=0.70),
                appearance = list(rhs=c("cosmetics=Yes"), default="lhs"))

summary(rules)

inspect(rules)

plot(rules)

plot(rules, method="grouped")

plot(rules@quality)

?plotly_arules
??plotly_arules

rules3 = apriori(marketbasket,
                 parameter = list(minlen=2, maxlen=4, conf=0.60),
                 appearance = list(rhs=c("banana=Yes", "apples=Yes", "avocado=Yes"), default="lhs"))

ploty_arules(rules3)

rules2 = apriori(marketbasket,
                 parameter = list(minlen=2,maxlen=3, conf=0.7),
                 appearance = list(rhs =c("cosmetics=Yes"),
                                   lhs=c("apples=Yes",
                                         "banana=Yes",
                                         "coke=Yes",
                                         "turkey=Yes",
                                         "bourbon=Yes",
                                         "ice_cream=Yes",
                                         "baguette=Yes",
                                         "soda=Yes",
                                         "choclate=Yes",
                                         "cracker=Yes",
                                         "avocado=Yes",
                                         "sardines=Yes"),
                                   default ="none"))
inspect(rules2)
?ruleExplorer

rule_ex = apriori(marketbasket,
                  parameter = list(minlen=2, maxlen=4, conf=0.75))
ruleExplorer(rule_ex) 





