Class {
	#name : #LeaBuildDC,
	#superclass : #Object,
	#instVars : [
		'typeDict'
	],
	#category : #'SQL-Lea'
}

{ #category : #running }
LeaBuildDC >> createAttribute: attributeName type: typeName [

	| attribute |
	attribute := FamixJavaAttribute new
		name: attributeName ;
		yourself.

	attribute declaredType: (self ensureType: typeName).
	
	^attribute
]

{ #category : #running }
LeaBuildDC >> createClass: nom [

	^FamixJavaClass new
		name: nom ;
		yourself.
]

{ #category : #running }
LeaBuildDC >> createClassPerson [

	| class |
	class := self createClass: 'Person'.
	class addAttribute: (self createAttribute: 'LastName' type: 'String').
	class addAttribute: (self createAttribute: 'FirstName' type: 'String').
	class addAttribute: (self createAttribute: 'Address' type: 'String').
	class addAttribute: (self createAttribute: 'City' type: 'String').

	^class
]

{ #category : #running }
LeaBuildDC >> createType: typeName [
	^FamixJavaType new
		name: typeName;
		yourself.
]

{ #category : #running }
LeaBuildDC >> createTypeReferenceFrom: referencer to: type [
	
	^FamixSQLTypeReference new
		referencer: referencer ;
		type: type ;
		yourself
]

{ #category : #running }
LeaBuildDC >> ensureType: typeName [

	^typeDict
		at: typeName
		ifAbsentPut: [ self createType: typeName ]
]

{ #category : #running }
LeaBuildDC >> initialize [

	super initialize.

	typeDict := Dictionary new
]
