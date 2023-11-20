Extension { #name : #FamixPraxemAttribute }

{ #category : #'*Praxem-To-SQL' }
FamixPraxemAttribute >> accept: visitor [
	
	visitor visitPraxemAttribute: self
]
