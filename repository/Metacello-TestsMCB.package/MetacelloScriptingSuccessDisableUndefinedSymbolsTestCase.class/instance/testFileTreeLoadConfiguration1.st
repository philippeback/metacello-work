tests
testFileTreeLoadConfiguration1
  Metacello new
    project: 'ExternalX';
    className: 'ConfigurationOfExternalX';
    version: '0.9.0';
    repository: 'filetree://' , configurationDirectory fullName;
    silently;
    load.
  self
    validate: 'ConfigurationOfExternalX'
    expConfigVersion: '0.9.0'
    expConfigRepo: 'filetree://' , configurationDirectory fullName
    expBaselineClassName: nil
    expBaselineVersion: nil
    expBaselineRepo: nil