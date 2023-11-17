Class {
	#name : #LeaPraxemResolver,
	#superclass : #Object,
	#category : #'SQL-Lea'
}

{ #category : #'as yet unclassified' }
LeaPraxemResolver >> checkAttributeType: aModel [
	
	| praxemClass |
	(aModel allWithType: FamixPraxemAttribute) do: 
		[ :anAttribute | 
			praxemClass := (aModel allWithType: FamixPraxemClass)
				detect: [:aClass |
					aClass name = (anAttribute attributeAt: #attributeType ifAbsent: '')]
				ifNone: [nil].
			
			anAttribute declaredType: praxemClass.
		]


	

]
