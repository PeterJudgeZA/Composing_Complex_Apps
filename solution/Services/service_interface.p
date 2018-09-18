/*------------------------------------------------------------------------
    File        : service_interface.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Wed May 20 10:02:27 EDT 2015
    Notes       :
  ----------------------------------------------------------------------*/
block-level on error undo, throw.

using Services.*.
using Managers.*.
using Progress.Lang.AppError.
using Progress.Lang.Error.

define input        parameter pcServiceName as character no-undo.
define input        parameter pcOperation as character no-undo.
define input-output parameter dataset-handle phServiceData.
define input-output parameter dataset-handle phServiceParams.

/* ***************************  Main Block  *************************** */
define variable oBE as IBusinessEntity no-undo.
define variable oAuthMgr   as IAuthorizationManager  no-undo.

oAuthMgr = AuthManagerBuilder:Build():Manager.
oAuthMgr:AuthorizeServiceOperation(pcServiceName, pcOperation).

oBE = BusinessEntityBuilder:Build(pcServiceName):Entity.

case pcOperation:
    when 'fetch' then
        oBE:Fetch(input-output dataset-handle phServiceData, 
                  input-output dataset-handle phServiceParams).
    when 'save' then
        oBE:Save(input-output dataset-handle phServiceData, 
                 input-output dataset-handle phServiceParams).
    otherwise
        undo, throw new AppError('unsupported operation: ' + pcOperation).
end case.   /* operation */
        
catch e as Progress.Lang.Error:
    return error e:GetMessage(1).    
end catch.
/* eof */
