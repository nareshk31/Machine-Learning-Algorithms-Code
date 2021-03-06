#Read data file
mydata <- read.csv("~/Dropbox/Public/Cardiotocographic.csv")
mydata$NSPF <- as.factor(mydata$NSP)

#Multinomial Logistic regression
library(nnet)
mydata$out<-relevel(mydata$NSPF, ref="1")
mymodel<-multinom(out~LB+AC+FM, data=mydata)
summary(mymodel)
                    
#2-tailed z test
z <- summary(mymodel)$coefficients/summary(mymodel)$standard.errors
p <- (1 - pnorm(abs(z), 0, 1)) * 2
p
                    