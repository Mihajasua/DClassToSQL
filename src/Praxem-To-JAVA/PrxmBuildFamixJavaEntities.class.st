Class {
	#name : #PrxmBuildFamixJavaEntities,
	#superclass : #Object,
	#instVars : [
		'typeDict'
	],
	#category : #'Praxem-To-JAVA'
}

{ #category : #'private-entity-creation' }
PrxmBuildFamixJavaEntities >> createAttributeDeclaration: attributeName type: typeName [

	| attribute |
	attribute := FamixJavaAttribute new
		name: attributeName ;
		yourself.

	self createTypeReferenceFrom: attribute to: (self ensureType: typeName).
	
	^attribute
]

{ #category : #'private-entity-creation' }
PrxmBuildFamixJavaEntities >> createClass: className [

	^FamixJavaClass new
		name: className;
		yourself.
]

{ #category : #'as yet unclassified' }
PrxmBuildFamixJavaEntities >> createMethod: methodName type: methodType [

	^FamixJavaMethod new
		name: methodName ;
		yourself.

]

{ #category : #running }
PrxmBuildFamixJavaEntities >> createTypeReferenceFrom: referencer to: type [
	
	^FamixJavaType new
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
