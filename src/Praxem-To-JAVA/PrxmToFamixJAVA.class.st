Class {
	#name : #PrxmToFamixJAVA,
	#superclass : #PrxmAbstractVisitorToJava,
	#instVars : [
		'builder',
		'model',
		'context'
	],
	#category : #'Praxem-To-JAVA'
}

{ #category : #initialization }
PrxmToFamixJAVA >> initialize [

	super initialize.

	model := FamixJavaModel new.
	builder := PrxmBuildFamixJavaEntities new.
	
	context := Stack new
]

{ #category : #accessing }
PrxmToFamixJAVA >> model [

	^ model
]

{ #category : #accessing }
PrxmToFamixJAVA >> model: anObject [

	model := anObject
]

{ #category : #'as yet unclassified' }
PrxmToFamixJAVA >> sqlType: type [

	type 
		ifNil: [^'unknown' ]
 		ifNotNil: [ 
			(type name = 'Numerique') ifTrue: [ ^'int'].
			(type name = 'Texte') ifTrue: [ ^'varchar(255)'].
			(type name = 'Boolean') ifTrue: [ ^'boolean'].
			(type name = 'Date') ifTrue: [ ^'date'].
			(type attributes) ifNotNil: [ ^type name].
			 ^ 'unknown'
		]
	



	
]

{ #category : #visiting }
PrxmToFamixJAVA >> visitPraxemAttribute: aPraxemAttribute [



]

{ #category : #visiting }
PrxmToFamixJAVA >> visitPraxemClass: aPraxemClass [



	| aJavaClass |

	aJavaClass := builder createClass: aPraxemClass name.
	model add: aJavaClass.
	context push: aJavaClass.
		
]

{ #category : #visiting }
PrxmToFamixJAVA >> visitPraxemMethod: aPraxemMethod [


]

{ #category : #visiting }
PrxmToFamixJAVA >> visitePraxemAttributeType: aPraxemAttributeType [

]
