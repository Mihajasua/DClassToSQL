Class {
	#name : #PrxmBuildFamixSQLEntities,
	#superclass : #Object,
	#instVars : [
		'typeDict'
	],
	#category : #'Praxem-To-SQL'
}

{ #category : #running }
PrxmBuildFamixSQLEntities >> createColum: columnName type: typeName [

	| column |
	column := FamixSQLColumn new
		name: columnName ;
		yourself.

	self createTypeReferenceFrom: column to: (self ensureType: typeName).
	
	^column
]

{ #category : #running }
PrxmBuildFamixSQLEntities >> createTable: nom [

	^FamixSQLTable new
		name: nom ;
		yourself.
]

{ #category : #running }
PrxmBuildFamixSQLEntities >> createType: typeName [
	^FamixSQLType new
		name: typeName;
		yourself.
]

{ #category : #running }
PrxmBuildFamixSQLEntities >> createTypeReferenceFrom: referencer to: type [
	
	^FamixSQLTypeReference new
		referencer: referencer ;
		type: type ;
		yourself
]

{ #category : #running }
PrxmBuildFamixSQLEntities >> ensureType: typeName [

	^typeDict
		at: typeName
		ifAbsent: [ self createType: typeName ]
]

{ #category : #running }
PrxmBuildFamixSQLEntities >> initialize [

	super initialize.

	typeDict := Dictionary new
]
