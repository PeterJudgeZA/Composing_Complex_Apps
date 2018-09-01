/*------------------------------------------------------------------------
   File        : LogManagerBuilder
   Description : 
   Notes       : 
 ----------------------------------------------------------------------*/
block-level on error undo, throw.

using Managers.*.
using Progress.Lang.Object.

class Managers.LogManagerBuilder abstract:
    /* Returns a useable Logging Manager */
    define abstract public property Manager as ILoggingManager no-undo get.
    
    method static public LogManagerBuilder Build():
        define variable oBuilder as LogManagerBuilder no-undo.
        
        oBuilder = new DefaultLogMgrBuilder().
        
        return oBuilder.
    end method.
  
end class.
