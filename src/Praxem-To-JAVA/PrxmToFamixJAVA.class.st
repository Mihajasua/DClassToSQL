Class {
	#name : #PrxmToFamixJava,
	#superclass : #PrxmAbstractVisitorToJava,
	#instVars : [
		'builder',
		'model',
		'context'
	],
	#category : #'Praxem-To-JAVA'
}

{ #category : #initialization }
PrxmToFamixJava >> initialize [

	super initialize.

	model := FamixJavaModel new.
	builder := PrxmBuildFamixJavaEntities new.
	builder model: model.
	
	context := Stack new
]

{ #category : #accessing }
PrxmToFamixJava >> model [

	^ model
]

{ #category : #accessing }
PrxmToFamixJava >> model: anObject [

	model := anObject
]

{ #category : #'as yet unclassified' }
PrxmToFamixJava >> sqlType: type [

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
PrxmToFamixJava >> visitPraxemAttribute: aPraxemAttribute [



]

{ #category : #visiting }
PrxmToFamixJava >> visitPraxemClass: aPraxemClass [

	| aJavaClass |

	aJavaClass := builder createClass: aPraxemClass name.
	context push: aJavaClass.

	super visitPraxemClass: aPraxemClass.

	context pop
]

{ #category : #visiting }
PrxmToFamixJava >> visitPraxemMethod: aPraxemMethod [


]

{ #category : #visiting }
PrxmToFamixJava >> visitePraxemAttributeType: aPraxemAttributeType [

]
