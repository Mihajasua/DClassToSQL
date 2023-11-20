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
PrxmBuildFamixSQLEntities >> createTablePersone [

	| table |
	table := self createTable: 'Person'.
	table addColumn: (self createColum: 'PersonID' type: 'int').
	table addColumn: (self createColum: 'LastName' type: 'varchar(255)').
	table addColumn: (self createColum: 'FirstName' type: 'varchar(255)').
	table addColumn: (self createColum: 'Address' type: 'varchar(255)').
	table addColumn: (self createColum: 'City' type: 'varchar(255)').

	^table
]

{ #category : #running }
PrxmBuildFamixSQLEntities >> createTableStudent [

	| table |
	table := self createTable: 'Student'.
	table addColumn: (self createColum: 'StudentID' type: 'int').
	table addColumn: (self createColum: 'LastName' type: 'varchar(255)').
	table addColumn: (self createColum: 'FirstName' type: 'varchar(255)').
	table addColumn: (self createColum: 'Class' type: 'varchar(255)').
	table addColumn: (self createColum: 'Speciality' type: 'varchar(255)').

	^table
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
