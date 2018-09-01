/*------------------------------------------------------------------------
   File        : ErrorManagerBuilder
   Description : 
   Notes       : 
 ----------------------------------------------------------------------*/
block-level on error undo, throw.

using Managers.*.
using Progress.Lang.Object.

class Managers.ErrorManagerBuilder abstract:
    /* Returns a useable Error Manager */
    define abstract public property Manager as IErrorManager no-undo get.
    
    method static public ErrorManagerBuilder Build():
        define variable oBuilder as ErrorManagerBuilder no-undo.
        
        oBuilder = new DefaultErrorMgrBuilder().
        
        return oBuilder.
    end method.
  
end class.
