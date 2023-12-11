Class {
	#name : #FamixPraxemReturnValue,
	#superclass : #FamixPraxemEntity,
	#traits : 'FamixTNamedEntity + FamixTTypedEntity',
	#classTraits : 'FamixTNamedEntity classTrait + FamixTTypedEntity classTrait',
	#instVars : [
		'#method => FMOne type: #FamixPraxemMethod opposite: #returnValue'
	],
	#category : #'Famix-Praxem-Entities-Entities'
}

{ #category : #meta }
FamixPraxemReturnValue class >> annotation [

	<FMClass: #ReturnValue super: #FamixPraxemEntity>
	<package: #'Famix-Praxem-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixPraxemReturnValue >> method [
	"Relation named: #method type: #FamixPraxemMethod opposite: #returnValue"

	<generated>
	<derived>
	^ method
]

{ #category : #accessing }
FamixPraxemReturnValue >> method: anObject [

	<generated>
	method := anObject
]
