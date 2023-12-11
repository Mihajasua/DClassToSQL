Class {
	#name : #FamixPraxemMethod,
	#superclass : #FamixPraxemEntity,
	#traits : 'FamixTMethod',
	#classTraits : 'FamixTMethod classTrait',
	#instVars : [
		'#returnValue => FMOne type: #FamixPraxemReturnValue opposite: #method'
	],
	#category : #'Famix-Praxem-Entities-Entities'
}

{ #category : #meta }
FamixPraxemMethod class >> annotation [

	<FMClass: #Method super: #FamixPraxemEntity>
	<package: #'Famix-Praxem-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixPraxemMethod >> returnValue [
	"Relation named: #returnValue type: #FamixPraxemReturnValue opposite: #method"

	<generated>
	^ returnValue
]

{ #category : #accessing }
FamixPraxemMethod >> returnValue: anObject [

	<generated>
	returnValue := anObject
]
