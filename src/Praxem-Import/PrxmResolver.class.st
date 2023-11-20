Class {
	#name : #PrxmResolver,
	#superclass : #Object,
	#category : #'Praxem-Import'
}

{ #category : #'as yet unclassified' }
PrxmResolver >> checkAttributeType: aModel [
	
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
