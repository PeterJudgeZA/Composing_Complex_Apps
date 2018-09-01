/*------------------------------------------------------------------------
   File        : AuthorizationManager
   Description : 
   Notes       : 
 ----------------------------------------------------------------------*/
block-level on error undo, throw.

using Managers.IAuthorizationManager.

class Managers.AuthorizationManager implements IAuthorizationManager: 
    method public void AuthorizeServiceOperation(input pcService as character,
                                                 input pcOperation as character).
    end method.
end class.