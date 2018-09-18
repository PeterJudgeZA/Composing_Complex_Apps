/*------------------------------------------------------------------------
    File        : IDataAccess
    Description : 
    Notes       : 
  ----------------------------------------------------------------------*/

interface Services.IDataAccess:  
    method public void Fetch(input-output dataset-handle phData, input-output dataset-handle phParams).
    method public void Save (input-output dataset-handle phData, input-output dataset-handle phParams).
end interface.