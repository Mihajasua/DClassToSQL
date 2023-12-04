Class {
	#name : #PrxmBuildFamixJavaEntities,
	#superclass : #Object,
	#instVars : [
		'typeDict',
		'model'
	],
	#category : #'Praxem-To-JAVA'
}

{ #category : #'private-entity-creation' }
PrxmBuildFamixJavaEntities >> createAttributeDeclaration: attributeName type: typeName [

	| attribute |
	attribute := FamixJavaAttribute new
		mooseModel: model ;
		name: attributeName ;
		yourself.

	self createTypeReferenceFrom: attribute to: (self ensureType: typeName).
	
	^attribute
]

{ #category : #'private-entity-creation' }
PrxmBuildFamixJavaEntities >> createClass: className [

	^FamixJavaClass new
		mooseModel: model ;
		name: className;
		yourself.
]

{ #category : #'private-entity-creation' }
PrxmBuildFamixJavaEntities >> createMethod: methodName type: methodType [

	^FamixJavaMethod new
		mooseModel: model ;
		name: methodName ;
		yourself.

]

{ #category : #running }
PrxmBuildFamixJavaEntities >> createTypeReferenceFrom: referencer to: type [
	
	^FamixJavaType new
		mooseModel: model ;
		referencer: referencer ;
		type: type ;
		yourself
]

{ #category : #running }
PrxmBuildFamixJavaEntities >> ensureType: typeName [

	^typeDict
		at: typeName
		ifAbsent: [ self createType: typeName ]
]

{ #category : #initialization }
PrxmBuildFamixJavaEntities >> initialize [

	super initialize.

	typeDict := Dictionary new
]

{ #category : #accessing }
PrxmBuildFamixJavaEntities >> model [

	^ model
]

{ #category : #accessing }
PrxmBuildFamixJavaEntities >> model: anObject [

	model := anObject
]
