Class {
	#name : #FamixPraxemModel,
	#superclass : #MooseModel,
	#traits : 'FamixPraxemTEntityCreator',
	#classTraits : 'FamixPraxemTEntityCreator classTrait',
	#category : #'Famix-Praxem-Entities-Model'
}

{ #category : #accessing }
FamixPraxemModel class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits')
]

{ #category : #meta }
FamixPraxemModel class >> annotation [
	<FMClass: #FamixPraxemModel super: #MooseModel>
	<package: #'Famix-Praxem-Entities'>
	<generated>
]
