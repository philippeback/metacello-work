tests
testIssue399H
  "https://github.com/dalehenrich/metacello-work/issues/399#issuecomment-231144979"

  "Issue399-Core package is in sampleRepository and externalRepository. BaselineOfIssue399 package is in external repository"

  "Swap packages after the first load"

  "See https://github.com/dalehenrich/metacello-work/issues/399#issuecomment-231464884"

  Metacello new
    baseline: 'Issue399Cypress';
    repository: 'filetree://' , externalDirectory fullName;
    silently;
    load.
  self assert: (Smalltalk at: #'Issue399Sample' ifAbsent: [  ]) isNil.
  self assert: (Smalltalk at: #'Issue399External' ifAbsent: [  ]) notNil.	"Confirm that package from external repo loaded"
  self
    setUpRepositoryContents: #('Issue399-Core-dkh.2')
    sourceRepo: MetacelloScriptingResource current sampleRepository
    targetRepo: (MCFileTreeRepository new directory: externalDirectory).
  Metacello new
    baseline: 'Issue399Cypress';
    repository: 'filetree://' , externalDirectory fullName;
    silently;
    load.
  self assert: (Smalltalk at: #'Issue399Sample' ifAbsent: [  ]) notNil.	"Confirm that package from sample repo loaded"
  self assert: (Smalltalk at: #'Issue399External' ifAbsent: [  ]) isNil