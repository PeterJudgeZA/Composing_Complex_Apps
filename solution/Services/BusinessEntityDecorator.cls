/*------------------------------------------------------------------------
   File        : BusinessEntityDecorator
   Purpose     : 
   Syntax      : 
   Description : 
   Author(s)   : pjudge
   Created     : Fri May 22 10:11:39 EDT 2015
   Notes       : 
 ----------------------------------------------------------------------*/

using Progress.Lang.*.
using Services.IBusinessEntity.

block-level on error undo, throw.

class Services.BusinessEntityDecorator abstract implements IBusinessEntity: 
  define public property DecoratedBE as IBusinessEntity no-undo get. private set.
  
  /* properties, methods from interface */
  define public property DataAccess as Services.IDataAccess no-undo
    get():
      return DecoratedBE:DataAccess.
    end get.

  constructor public BusinessEntityDecorator(input poBE as IBusinessEntity):
    assign DecoratedBE = poBE.
  end. 

  method public void Fetch(input-output dataset-handle phData, input-output dataset-handle phParams ):
    DecoratedBE:Fetch(input-output dataset-handle phData, input-output dataset-handle phParams).
  end method.
	
  method public void Save( input-output dataset-handle phData, input-output dataset-handle phParams ):
    DecoratedBE:Save(input-output dataset-handle phData, input-output dataset-handle phParams).
  end method.  
  
end class.