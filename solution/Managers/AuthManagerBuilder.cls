/*------------------------------------------------------------------------
   File        : AuthManagerBuilder
   Description : 
   Notes       : 
 ----------------------------------------------------------------------*/
block-level on error undo, throw.

using Managers.*.
using Services.*.
using Progress.Lang.Object.

class Managers.AuthManagerBuilder abstract:
    /* Returns a useable Auth Manager */
    define abstract public property Manager as IAuthorizationManager no-undo get.
    
    method static public AuthManagerBuilder Build():
        define variable oBuilder as AuthManagerBuilder no-undo.
        
        oBuilder = new DefaultAuthMgrBuilder().
        
        return oBuilder.
    end method.
  
end class.
