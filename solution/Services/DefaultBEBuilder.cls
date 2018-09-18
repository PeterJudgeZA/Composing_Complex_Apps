/*------------------------------------------------------------------------
   File        : DefaultBEBuilder
   Description : 
   Notes       : 
 ----------------------------------------------------------------------*/
block-level on error undo, throw.

using Services.*.
using Managers.*.
using Progress.Lang.Object.

class Services.DefaultBEBuilder inherits BusinessEntityBuilder: 
    define private variable mcServiceName as character no-undo.
  
    define override public property Entity as IBusinessEntity no-undo 
        get():
            define variable oDAO as IDataAccess no-undo.
            define variable oBE as IBusinessEntity no-undo.
            define variable oValue as Object no-undo.
            
            /* do we have a passed-in version? */
            GetConfigOption('DAO', output oValue).
            if valid-object(oValue) and type-of(oValue, IDataAccess) then
                oDAO = cast(oValue, IDataAccess).
            else
                oDAO = DataAccessBuilder:Build(mcServiceName):DataAccess.
            
            oBE = dynamic-new 'Services.' + mcServiceName  + 'BE' (oDAO).
            
            /* Add decorators */
            if GetConfigOption('SupportLog') and not type-of(oBE, ISupportLogging) then        
                oBE = new LoggingBE(oBE).

            if GetConfigOption('SupportAuth') and not type-of(oBE, ISupportAuthorization) then        
                oBE = new AuthorizedBE(oBE).   
            
            /* inject the manager dependencies */
            if type-of(oBE, ISupportLogging) then
            do:
                GetConfigOption('LogMgr', output oValue).
                if valid-object(oValue) and type-of(oValue, ILoggingManager) then
                    cast(oBE, ISupportLogging):LogMgr = cast(oValue, ILoggingManager).
                else
                    cast(oBE, ISupportLogging):LogMgr = LogManagerBuilder:Build():Manager.
            end.

            if type-of(oBE, ISupportAuthorization) then
            do:
                GetConfigOption('AuthMgr', output oValue).
                if valid-object(oValue) and type-of(oValue, IAuthorizationManager) then
                    cast(oBE, ISupportAuthorization):AuthMgr = cast(oValue, IAuthorizationManager).
                else
                    cast(oBE, ISupportAuthorization):AuthMgr = AuthManagerBuilder:Build():Manager.
            end.

            if type-of(oBE, ISupportErrorHandling) then 
            do:
                GetConfigOption('AuthMgr', output oValue).
                if valid-object(oValue) and type-of(oValue, IErrorManager) then
                    cast(oBE, ISupportErrorHandling):ErrMgr = cast(oValue, IErrorManager).
                else
                    cast(oBE, ISupportErrorHandling):ErrMgr = ErrorManagerBuilder:Build():Manager.
            end.

            return oBE.
        end get.
    
    constructor public DefaultBEBuilder(input pcServiceName as character):
        mcServiceName = pcServiceName.
    end constructor.
    
end class.
