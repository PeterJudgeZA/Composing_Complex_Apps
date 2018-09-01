/*------------------------------------------------------------------------
    File        : service_interface.p
    Description : Gateway procedure
    Notes       :
  ----------------------------------------------------------------------*/
block-level on error undo, throw.

using Services.*.
using Managers.*.
using Progress.Lang.AppError.

define input        parameter pcServiceName as character no-undo.
define input        parameter pcOperation as character no-undo.
define input-output parameter dataset-handle phServiceData.
define input-output parameter dataset-handle phServiceParams.

/* ***************************  Main Block  *************************** */
define variable oCustBE  as Services.CustomerBE           no-undo.
define variable oOrderBE as Services.OrderBE              no-undo.
define variable oAuthMgr as Managers.AuthorizationManager no-undo.

oAuthMgr = new Managers.AuthorizationManager().
oAuthMgr:AuthorizeServiceOperation(pcServiceName, pcOperation).

case pcServiceName:
    when 'Customer' then
        do:
            oCustBE = new Services.CustomerBE().
        
            if pcOperation eq 'fetch' then
                oCustBE:Fetch(input-output dataset-handle phServiceData, 
                              input-output dataset-handle phServiceParams).
            else
                if pcOperation eq 'save' then
                    oCustBE:Save(input-output dataset-handle phServiceData, 
                                 input-output dataset-handle phServiceParams).
                else
                    undo, throw new AppError('unsupported operation: ' + pcOperation).
        end.    
    when 'Orders'   then 
        do:
            oOrderBE = new Services.OrderBE().
            if pcOperation eq 'fetch' then
                oCustBE:Fetch(input-output dataset-handle phServiceData, 
                              input-output dataset-handle phServiceParams).
            else
                if pcOperation eq 'save' then
                    oCustBE:Save(input-output dataset-handle phServiceData, 
                                 input-output dataset-handle phServiceParams).
                else
                    undo, throw new AppError('unsupported operation: ' + pcOperation).
        end.        
end case.

catch e as Progress.Lang.Error:
    return error e:GetMessage(1).    
end catch.