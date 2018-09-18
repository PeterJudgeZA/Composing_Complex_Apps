/*------------------------------------------------------------------------
    File        : CustomerBE
    Notes       : 
  ----------------------------------------------------------------------*/
using Services.*.
using Progress.Lang.AppError.

class Services.CustomerBE inherits BusinessEntity: 
    constructor public CustomerBE(input poDAO as IDataAccess):
        super(poDAO).
    end constructor.

    method override protected void ValidateSave( input dataset-handle phData ):
        define variable hBuffer as handle no-undo.
        hBuffer = phData:get-buffer-handle(1).
        
        hBuffer:find-first().
        
        if hBuffer::CustNum le 0 then
            return error new AppError('CustNum must be positive').	
    end method.
    
end class.
