Extension { #name : #FamixPraxemParameter }

{ #category : #'*Praxem-To-SQL' }
FamixPraxemParameter >> accept: visitor [
	
	visitor visitPraxemParameter: self
]
