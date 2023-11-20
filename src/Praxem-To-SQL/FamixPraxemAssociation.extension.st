Extension { #name : #FamixPraxemAssociation }

{ #category : #'*Praxem-To-SQL' }
FamixPraxemAssociation >> accept: visitor [

	^visitor visitPraxemAssociation: self.
]
