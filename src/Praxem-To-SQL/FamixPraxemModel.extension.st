Extension { #name : #FamixPraxemModel }

{ #category : #'*Praxem-To-SQL' }
FamixPraxemModel >> accept: visitor [
	
	visitor visitPraxemModel: self
]
