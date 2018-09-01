 
 /*------------------------------------------------------------------------
    File        : AuthorizationManager
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : pjudge
    Created     : Wed May 20 10:04:15 EDT 2015
    Notes       : 
  ----------------------------------------------------------------------*/
block-level on error undo, throw.

class Managers.AuthorizationManager: 
    method public void AuthorizeServiceOperation(input pcServiceName as character,
                                                 input pcOperation as character):
    end method.
    
end class.