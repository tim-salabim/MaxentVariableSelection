Subsetselection <-
    function(outdir,lowerexclusionthreshold){
        Resulttable <- read.csv(paste(outdir,"/maxentResults.csv",sep=""),sep=",",header=TRUE)
                                        # Select those columns where the column names contain the word "contribution"
        variable.contributions <- Resulttable[,(colnames(Resulttable) %in% grep("contribution",colnames(Resulttable),value=T))]
                                        # remove the '.contribution' tag from the result names
        colnames(variable.contributions) <- gsub(".contribution","",colnames(variable.contributions))
                                        # order the variable contributions so that the most influential variable is the first one
        variable.contributions <- variable.contributions[,order(variable.contributions,decreasing=TRUE)]
                                        # Discard variables with a percentage contribution below the 'lowerexclusionthreshold'
        variable.contributions.selected <- variable.contributions[,variable.contributions>lowerexclusionthreshold]
        return(variable.contributions.selected)
    }
