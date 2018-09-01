/*------------------------------------------------------------------------
    File        : ISupportAuthorization
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : pjudge
    Created     : Fri May 22 09:52:32 EDT 2015
    Notes       : 
  ----------------------------------------------------------------------*/

using Managers.IAuthorizationManager.

interface Managers.ISupportAuthorization:  
    define public property AuthMgr as IAuthorizationManager no-undo get. set.  
end interface.