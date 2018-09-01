/*------------------------------------------------------------------------
    File        : IBusinessEntity
    Description : 
    Notes       : 
  ----------------------------------------------------------------------*/
using Services.*.
  
interface Services.IBusinessEntity:
  define public property DataAccess as IDataAccess no-undo get.
    
  method public void Fetch(input-output dataset-handle phData, input-output dataset-handle phParams).
  method public void Save (input-output dataset-handle phData, input-output dataset-handle phParams).
  
end interface.
