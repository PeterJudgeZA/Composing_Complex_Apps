block-level on error undo, throw.

using Managers.*.
using Services.*.

class Services.AuthorizedBE inherits BusinessEntityDecorator /* means this implements IBusinessEntity */
    implements ISupportAuthorization:
          
    define public property AuthMgr as IAuthorizationManager no-undo get. set.
	 
    constructor public AuthorizedBE (input poBE as IBusinessEntity):
        super (input poBE).
    end constructor.
	
    method override public void Fetch( input-output dataset-handle phData, input-output dataset-handle phParams ):
        AuthMgr:AuthorizeServiceOperation(DecoratedBE:GetClass():TypeName, 'fetch').
    	  
        super:Fetch(input-output dataset-handle phData, input-output dataset-handle phParams).
    end method.	
	
end class.