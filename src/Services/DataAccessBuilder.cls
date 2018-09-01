/*------------------------------------------------------------------------
    File        : DataAccessBuilder
    Description : 
    Notes       :
  ----------------------------------------------------------------------*/
block-level on error undo, throw.

using Progress.Lang.Object.
using Services.*.

class Services.DataAccessBuilder abstract:
    /* Returns a useable DAO */
    define abstract public property DataAccess as IDataAccess no-undo get.
    
    method static public DataAccessBuilder Build(input pcServiceName as character):
        define variable oBuilder as DataAccessBuilder no-undo.
        
        case pcServiceName:
            /*default */
            otherwise oBuilder = new DefaultDABuilder(pcServiceName).
        end case.
        
        return oBuilder.
    end method.
  
end class.
