# Test data round-trip

This is the project that contains the code to test whether the `.prsrc()`
method produces output that:
1. is valid Acton code,
2. when reconsutructed, is equivalent to the input.

The files in this project are created as output from the `../test_data_classes`
project tests.

## gdata round-trip
`gdata_tree.prsrc()` produces a string representation of the gdata tree, that
is valid Acton code. We compare the reconstructed gdata tree with one we get
from parsing the input XML directly.

## adata round-drop
`adata.prsrc()` produces Acton code to set the attributes in a adata tree.
There is no equality check for adata trees, so we first dump the reconstructed
adata tree to gdata, then to XML and compare the document with the input.