/*------------------------------------------------------------------------
   File        : LoggingBE
   Description : 
   Notes       : 
 ----------------------------------------------------------------------*/
block-level on error undo, throw.

using Managers.*.
using Services.*.

class Services.LoggingBE inherits BusinessEntityDecorator /* means this implements IBusinessEntity */
    implements ISupportLogging: 

    define public property LogMgr as ILoggingManager no-undo get. set. 

    constructor public LoggingBE (input poBE as IBusinessEntity):
        super (input poBE).
    end constructor.
	
    method override public void Fetch( input-output dataset-handle phData, input-output dataset-handle phParams ):
        define variable iNumRecords as integer no-undo.
	  
        super:Fetch(input-output dataset-handle phData, input-output dataset-handle phParams).
		
        LogMgr:LogMessage(substitute('Records fetched: &1', iNumRecords), 'BUSINESS-ENTITY').
		
        catch oError as Progress.Lang.Error :
            LogMgr:LogError(oError, 'BUSINESS-ENTITY').		
        end catch.
    end method.	
	
end class.