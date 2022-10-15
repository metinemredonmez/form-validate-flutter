

class ValidationMixin {
   // bütün validationları burada topladık! 
   String? validateFirstName(String value) {
        if(value.length < 2 ) {
          return "name of 2 cha. error";
        }
        return null;
      
     }


      // bütün validationları burada topladık! 
   String? validateSurName(String value) {
        if(value.length < 2 ) {
          return "name of 2 cha. error";
        }
        return null;
      
     }



      // bütün validationları burada topladık! 
   String? validateEmail(String value) {
        if(value.contains("@")) {
          return "mail geçerli değil";
        }
        return null;
      
     }



   }
