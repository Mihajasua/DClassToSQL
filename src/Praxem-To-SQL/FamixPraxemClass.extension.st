Extension { #name : #FamixPraxemClass }

{ #category : #'*Praxem-To-SQL' }
FamixPraxemClass >> accept: visitor [
	
	visitor visitPraxemClass: self
]
