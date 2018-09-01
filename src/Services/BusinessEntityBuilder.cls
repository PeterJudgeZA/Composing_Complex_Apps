/*------------------------------------------------------------------------
   File        : BusinessEntityBuilder
   Description : 
   Notes       : 
 ----------------------------------------------------------------------*/
block-level on error undo, throw.

using Managers.*.
using Services.*.
using Progress.Lang.Object.

class Services.BusinessEntityBuilder abstract:
    define private variable mlSupport as logical extent 2 no-undo.
    define private variable moDAO as IDataAccess no-undo.
    define private variable moAuthMgr as IAuthorizationManager no-undo.
    define private variable moLogMgr as ILoggingManager no-undo.
    define private variable moErrMgr as IErrorManager no-undo.
  
    /* Returns a useable BusinessEntity */
    define abstract public property Entity as IBusinessEntity no-undo get.
    
    method static public BusinessEntityBuilder Build(input pcServiceName as character):
        define variable oBuilder as BusinessEntityBuilder no-undo.
        
        case pcServiceName:
            /*default */
            otherwise oBuilder = new DefaultBEBuilder(pcServiceName).
        end case.
        
        return oBuilder.
    end method.
  
    /* lets us add a DAO to the BE */
    method public BusinessEntityBuilder FromDataAccess(input poDAO as IDataAccess):
        moDAO = poDAO.
        return this-object.
    end method.
    
    method public BusinessEntityBuilder SupportsAuthorization(input plSupport as logical):
        mlSupport[1] = plSupport.
        return this-object.
    end method.

    method public BusinessEntityBuilder UseAuthMgr(input poAuthMgr as IAuthorizationManager):
        SupportsAuthorization(true).
        moAuthMgr = poAuthMgr.
        return this-object.
    end method.
    
    method public BusinessEntityBuilder SupportsLogging(input plSupport as logical):
        mlSupport[2] = plSupport.
        return this-object.
    end method.

    method public BusinessEntityBuilder UseLogMgr(input poLogMgr as ILoggingManager):
        SupportsLogging(true).
        moLogMgr = poLogMgr.
        return this-object.
    end method.

    method public BusinessEntityBuilder UseErrMgr(input poErrMgr as IErrorManager):
        moErrMgr = poErrMgr.
        return this-object.
    end method.
    
    /* gets values out */
    method protected logical GetConfigOption(input pcName as char):
        case pcName:
            when 'SupportAuth'  then return mlSupport[1].
            when 'SupportLog'   then return mlSupport[2].
        end case.
    end method.
    
    method protected logical GetConfigOption(input pcName as char, output poValue as Object):
        case pcName:
            when 'DAO'     then poValue = moDAO.
            when 'AuthMgr' then poValue = moAuthMgr.
            when 'LogMgr'  then poValue = moLogMgr.
            when 'ErrMgr'  then poValue = moErrMgr.
        end case.
        
        return valid-object(poValue).
    end method.
    
end class.

