/*------------------------------------------------------------------------ 
   File        : BusinessEntity
   Description : 
   Notes       : 
 ----------------------------------------------------------------------*/
block-level on error undo, throw.

using Managers.*.
using Services.*.

class Services.BusinessEntity abstract implements IBusinessEntity, ISupportErrorHandling: 
    define public property DataAccess as IDataAccess no-undo get. private set.
	define public property ErrMgr as IErrorManager no-undo get. set. 
	
    constructor public BusinessEntity(input poDAO as IDataAccess):
        assign DataAccess = poDAO.
    end constructor.

    method public void Fetch(input-output dataset-handle phData, input-output dataset-handle phParams):
        this-object:DataAccess:Fetch(input-output dataset-handle phData, input-output dataset-handle phParams).
    end method.
    
    method abstract protected void ValidateSave(input dataset-handle phData).

    method public void Save (input-output dataset-handle phData, input-output dataset-handle phParams):
        this-object:ValidateSave(dataset-handle phData by-reference).
        this-object:DataAccess:Save(input-output dataset-handle phData, input-output dataset-handle phParams).
    end method.    

end class.
