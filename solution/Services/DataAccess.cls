 /*------------------------------------------------------------------------
    File        : DataAccess
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : pjudge
    Created     : Thu May 21 14:10:03 EDT 2015
    Notes       : 
  ----------------------------------------------------------------------*/
block-level on error undo, throw.

class Services.DataAccess abstract: 

    method abstract public void Fetch(input-output dataset-handle phData, input-output dataset-handle phParams).
    method abstract public void Save (input-output dataset-handle phData, input-output dataset-handle phParams).

end class.