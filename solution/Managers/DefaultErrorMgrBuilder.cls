/*------------------------------------------------------------------------
   File        : DefaultLogMgrBuilder
   Description : 
   Notes       : 
 ----------------------------------------------------------------------*/
block-level on error undo, throw.

using Managers.*.

class Managers.DefaultErrorMgrBuilder inherits ErrorManagerBuilder:
     
    define override public property Manager as IErrorManager no-undo 
        get():
            return new ErrorManager().
        end get.
    
end class.
