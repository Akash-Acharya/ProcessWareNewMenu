procedure ChatBotProcessProc:
define input parameter inPrompt as character no-undo.
define output parameter outPromptDetails as character no-undo.
define output parameter outResponse as character no-undo.

def var localPrompt as character no-undo.
def var outCategory as character no-undo.
def var outAction as character no-undo.
def var outActionFilter as character no-undo.

run IdentifyPrompt(inPrompt,
                   output outCategory,
                   output outAction,
                   output outActionFilter).

run CleanPrompt(outCategory,
                inPrompt,
                output localPrompt).

outPromptDetails = outCategory + " ; " 
            + outAction + " ; " 
            + outActionFilter + " ; " 
            + localPrompt.

case outCategory:

    when "Details" then
      run DetailsProc (input outAction, input outActionFilter, input localPrompt, output outResponse).

    when "Inventory" then
      run InventoryProc (input outAction, input outActionFilter, input localPrompt, output outResponse).
   
    when "Purchase" then
      run PurchaseProc.
   
    when "Sales" then
      run SalesProc.
    
   otherwise
      run AlienProc.
end case.

end procedure.
/*-----*/

procedure IdentifyPrompt:
   define input parameter inPrompt as character no-undo.
   define output parameter outCategory as character no-undo.
   define output parameter outAction as character no-undo.
   define output parameter outActionFilter as character no-undo.

   if index(inPrompt,"Inventory") > 0 then
      assign outCategory = "Inventory".
   else
   if index(inPrompt,"Purchase") > 0 then
      assign outCategory = "Purchase".
   else
   if index(inPrompt,"Sales") > 0 then
      assign outCategory = "Sales".
   else
   if index(inPrompt,"Details") > 0 or
      INDEX(inPrompt,"Vendors") > 0 or 
      INDEX(inPrompt,"Customers") > 0 then
      assign outCategory = "Details".
   
   if outCategory <> "" then
   do:
      if index(inPrompt,"Show") > 0 or
         INDEX(inPrompt,"List") > 0 or
         INDEX(inPrompt,"View") > 0 then
         assign outAction = "Inquiry".

      if index(inPrompt,"Code") > 0 then
         assign outActionFilter = "Product Code".

       if index(inPrompt,"Name") > 0 then   .
         assign outActionFilter = "Product Name".

      if index(inPrompt,"Product") > 0 then
         assign outActionFilter = "Product".
   end.
   else
      assign outCategory = "<NEW>".
end procedure.

procedure DetailsProc:  
   define input parameter outAction as character no-undo.
   define input parameter outActionFilter as character no-undo.
   define input parameter localPrompt as character no-undo.
   define output parameter outResponse as character no-undo.

   case outAction:

       when "Inquiry" then
       do:
          if index(outActionFilter,"Product") > 0 then
          do:
             case outActionFilter:
                when "Product Code" then
                do:
                  find first MasterProduct where
                       //MasterProduct.OperatingUnit = "processWare":U and
                       MasterProduct.ProductCOde = localPrompt
                       no-lock no-error.

                  if not available MasterProduct then
                     assign outResponse = "Invalid Product Code.".
                  else
                  do:
                     assign outResponse = MasterProduct.ProductCode + "(" + MasterProduct.ProductName + ")" + CHR(10)
                                          + "CAS - " + MasterProduct.CAS[1] + CHR(10)
                                          + "Product Type - " + MasterProduct.ProductType + CHR(10)
                                          + "Product Class - " + MasterProduct.ProductClass + CHR(10)
                                          + "OnHand - " + STRING(MasterProduct.Quantity[1]) + MasterProduct.UoM + CHR(10).
                  end.
                end.

                when "Product Name" or
                when "Product" then
                do:
                  for each MasterProduct where
                      //MasterProduct.OperatingUnit = "processWare":U and
                      MasterProduct.ProductName begins localPrompt
                      no-lock:
                      
                      assign outResponse = outResponse + (if outResponse <> "" then chr(10) + CHR(10) else "") 
                                           + MasterProduct.ProductCode + "(" + MasterProduct.ProductName + ")" + CHR(10)
                                           + "CAS - " + MasterProduct.CAS[1] + CHR(10)
                                           + "Product Type - " + MasterProduct.ProductType + CHR(10)
                                           + "Product Class - " + MasterProduct.ProductClass + CHR(10)
                                           + "OnHand - " + STRING(MasterProduct.Quantity[1]) + MasterProduct.UoM + CHR(10).
                  end.

                  if outResponse = "" then
                     assign outResponse = "Invalid Product Name.".
                end.
             end case.
          end.
       end.
   end case.
end procedure.

procedure InventoryProc:  
   define input parameter outAction as character no-undo.
   define input parameter outActionFilter as character no-undo.
   define input parameter localPrompt as character no-undo.  
   define output parameter outResponse as character no-undo.

   case outAction:

       when "Inquiry" then
       do:
          case outActionFilter:
              when "Product Code" then
              do:
                 find first MasterProduct where
                      //MasterProduct.OperatingUnit = "processWare":U and
                      MasterProduct.ProductCOde = localPrompt
                      no-lock no-error.

                 if not available MasterProduct then
                    assign outResponse = "Invalid Product Code.".
                 else
                    assign outResponse = string(MasterProduct.Quantity[1]) + MasterProduct.UoM.
              end.

              when "Product Name" or
              when "Product" then
              do:
                 for each MasterProduct where
                     //MasterProduct.OperatingUnit = "processWare":U and
                     MasterProduct.ProductName begins localPrompt
                     no-lock:
                      
                     assign outResponse = outResponse + (if outResponse <> "" then chr(10) else "") +  
                                          MasterProduct.ProductCode + " - " + STRING(MasterProduct.Quantity[1]) + MasterProduct.UoM + " - " + MasterProduct.ProductName.
                 end.

                 if outResponse = "" then
                    assign outResponse = "Invalid Product Name.".
              end.
          end case.
       end.
   end case.
end procedure.

procedure PurchaseProc:

end procedure.

procedure SalesProc:

end procedure.

procedure AlienProc:
   //assign outResponse = "Please provide more details....".
end procedure.

procedure CleanPrompt:
   define input parameter inPromptCategory as character no-undo.
   define input parameter inPrompt as character no-undo.
   define output parameter outPrompt as character no-undo.

   def var localCounter as integer no-undo.
   def var localToRemove as character no-undo.

   assign outPrompt = inPrompt.

/*    CASE inPromptCategory:    */
/*                              */
/*        WHEN "Inventory" THEN */
          assign localToRemove = localToRemove + "Inventory,Show,Details,List,Product,Code,Name,for,me".
/*    END CASE.  */

   do localCounter = 1 to num-entries(localToRemove):

      assign outPrompt = trim(replace(outPrompt,entry(localCounter,localToRemove),"")).
   end.
end procedure.
