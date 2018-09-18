/*------------------------------------------------------------------------
   File        : DefaultAuthMgrBuilder
   Description : 
   Notes       : 
 ----------------------------------------------------------------------*/
block-level on error undo, throw.

using Managers.*.
class Managers.DefaultAuthMgrBuilder inherits AuthManagerBuilder:
     
    define override public property Manager as IAuthorizationManager no-undo 
        get():
            return new AuthorizationManager().
        end get.
    
end class.
