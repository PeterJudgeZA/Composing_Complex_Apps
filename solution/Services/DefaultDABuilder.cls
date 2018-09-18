/*------------------------------------------------------------------------
   File        : DefaultDABuilder
   Description : 
   Notes       : 
 ----------------------------------------------------------------------*/
block-level on error undo, throw.

using Services.*.

class Services.DefaultDABuilder inherits DataAccessBuilder: 
    define private variable mcServiceName as character no-undo.
  
    define override public property DataAccess as IDataAccess no-undo 
        get():
            define variable oDAO as IDataAccess no-undo.
            
            oDAO = dynamic-new 'Services.' + mcServiceName  + 'DAO' ().
            
            return oDAO.
        end get.
    
    constructor public DefaultDABuilder(input pcServiceName as character):
        mcServiceName = pcServiceName.
    end constructor.
    
end class.
