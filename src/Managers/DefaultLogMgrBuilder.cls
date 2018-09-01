/*------------------------------------------------------------------------
   File        : DefaultLogMgrBuilder
   Description : 
   Notes       : 
 ----------------------------------------------------------------------*/
block-level on error undo, throw.

using Managers.*.

class Managers.DefaultLogMgrBuilder inherits LogManagerBuilder:
     
    define override public property Manager as ILoggingManager no-undo 
        get():
            return new FileLogManager().
        end get.
    
end class.
