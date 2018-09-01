
/*------------------------------------------------------------------------
    File        : IAuthorizationManager
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : pjudge
    Created     : Fri May 22 09:38:32 EDT 2015
    Notes       : 
  ----------------------------------------------------------------------*/

using Progress.Lang.*.

interface Managers.IAuthorizationManager:  
    method public void AuthorizeServiceOperation(input pcService as character,
                                                 input pcOperation as character).
end interface.