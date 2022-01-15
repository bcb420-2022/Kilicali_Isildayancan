# Task 4 BCB420
# Author: Kilicali Isildayancan

if (!requireNamespace('seqinr', quietly = TRUE)) {
  install.packages('seqinr')
}

data(aaindex, package = 'seqinr')

#Using some data from aaindex
lipoI <- aaindex$FASG890101  #hydrophobicity index
resVol <- aaindex$PONJ960101 #volumes of residues

#plotting hydrophobicity vs. volumes
plot(lipoI$I, resVol$I, xlab = 'hydrophobicity', ylab = 'volume', type = 'n')
text(lipoI$I, resVol$I, labels = seqinr::a(names(lipoI$I)))

#these are taken from the bcb420 wiki
seqinr::choosebank("swissprot")
mySeq <- seqinr::query("mySeq", "N=MBP1_YEAST")
mbp1 <- seqinr::getSequence(mySeq)
seqinr::closebank()
x <- seqinr::AAstat(mbp1[[1]])
barplot(sort(x$Compo), cex.names = 0.6)
