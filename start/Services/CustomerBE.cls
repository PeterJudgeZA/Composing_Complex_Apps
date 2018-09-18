using Services.*.
using Managers.*.

class Services.CustomerBE: 
    define public property DataAccess as Services.CustomerDAO   no-undo get. set.
    define public property LogMgr     as Managers.LoggingManager  no-undo get. set.
    define public property ErrorMgr   as Managers.ErrorManager  no-undo get. set.
    define public property AuthMgr    as Managers.AuthorizationManager  no-undo get. set.
    
    constructor public CustomerBE():
        /* services */
        this-object:DataAccess = new CustomerDAO().        
        /* managers */
        this-object:LogMgr = new LoggingManager().
        this-object:ErrorMgr = new ErrorManager().
        this-object:AuthMgr = new AuthorizationManager().
    end constructor.
    
    method public void Fetch(input-output dataset-handle phData, 
                             input-output dataset-handle phParams):
        this-object:DataAccess:Fetch(input-output dataset-handle phData,
                                     input-output dataset-handle phParams).
        /* calculated fields, whatnot */
    end method.

    method public void Save(input-output dataset-handle phData,
                            input-output dataset-handle phParams):
        /* validations */
        this-object:DataAccess:Save(input-output dataset-handle phData,
                                    input-output dataset-handle phParams).
    end method.

end class.
